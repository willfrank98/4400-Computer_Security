#include <stdlib.h>
#include <stdio.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <elf.h>
#include "decode.h"

/* Given the in-memory ELF header pointer as `ehdr` and a section
   header pointer as `shdr`, returns a pointer to the memory that
   contains the in-memory content of the section */
#define AT_SEC(ehdr, shdr) ((void *)(ehdr) + (shdr)->sh_offset)

/*************************************************************/


Elf64_Shdr* section_by_name(Elf64_Ehdr* ehdr, char* name) {
  Elf64_Shdr* shdrs = (void*)ehdr + ehdr->e_shoff;
  char* strs = (void*)ehdr+shdrs[ehdr->e_shstrndx].sh_offset;

  int i;
  for (i = 0; i < ehdr->e_shnum; i++) {
    if (strcmp(strs + shdrs[i].sh_name, name) == 0) {
      return shdrs+i;
    }
  }
  printf("Section %s not found\n", name);
  return 0;
}

Elf64_Shdr* section_by_index(Elf64_Ehdr* ehdr, int idx) {
  Elf64_Shdr* shdrs = (void*)ehdr + ehdr->e_shoff;
  return shdrs+idx;
}

void evaluate_code(code_t* code, Elf64_Addr adr, int length, Elf64_Ehdr *ehdr, int balanced) {
  instruction_t ins;
  code_t* end;
  end = code + length;
  while (code < end) {
    decode(&ins, code, adr);
    switch(ins.op) {
    case MOV_ADDR_TO_REG_OP:{ //done
      //printf("%p: ", code);
      //first check to see if unbalanced
      if (!balanced) {
        //if it's a proper access then it doesn't matter what this is
        //printf("balanced var access\n");
        break;
      }
      Elf64_Shdr* relas_shdr = section_by_name(ehdr, ".rela.dyn");
      Elf64_Rela* relas = AT_SEC(ehdr, relas_shdr);
      int i;
      for (i = 0; i < relas_shdr->sh_size/sizeof(Elf64_Rela); i++) {
        if (relas[i].r_offset == ins.addr) {
          int m = ELF64_R_SYM(relas[i].r_info);
          Elf64_Sym* syms = AT_SEC(ehdr, section_by_name(ehdr, ".dynsym"));
          char* name = AT_SEC(ehdr, section_by_name(ehdr, ".dynstr")) + syms[m].st_name;

          if (strncmp("protected_", name, 10) == 0) {
            //unbalanced protected var access
            //printf("unbalanced protected var access, crashing\n");
            replace_with_crash(code, &ins);
            return;
          }
        }
      }
      //printf("unbalanced unprotected var access\n");
      break;}

    case JMP_TO_ADDR_OP:{ //done
      //same as call op thing
      printf("%p: (JMP_TO)\n", code);
      Elf64_Shdr* plt_shdr = section_by_name(ehdr, ".rela.plt");
      Elf64_Rela* plt = AT_SEC(ehdr, plt_shdr);
      char* name;
      int i;
      for (i = 0; i < plt_shdr->sh_size/sizeof(Elf64_Rela); i++) {
        if (plt[i].r_offset == ins.addr) {
          //this is the called function, find its name
          int m = ELF64_R_SYM(plt[i].r_info);
          char* strs = AT_SEC(ehdr, section_by_name(ehdr, ".dynstr"));
          Elf64_Sym* syms = AT_SEC(ehdr, section_by_name(ehdr, ".dynsym"));
          name = strs + syms[m].st_name;

          if (strcmp(name, "open_it") == 0) {
            if (!balanced) {
              //double call of open_it, insert crash
              //printf("double call of open_it, crashing\n");
              replace_with_crash(code, &ins);
              return;
            } else {
              //printf("called open_it properly\n");
              balanced = 0;
              break;
            }
          } else if (strcmp(name, "close_it") == 0) {
            if (!balanced) {
              //printf("called close_it properly\n");
              balanced = 1;
              break;
            } else {
              //printf("double call of close_it, crashing\n");
              replace_with_crash(code, &ins);
              return;
            }
          }
        }
      }
      break;}

    case MAYBE_JMP_TO_ADDR_OP:{ //done
      //code maybe jumps to ins.addr, must consider both possibilities
      //printf("%p: conditional jump, eval at %p and %p\n", code, code + ins.length, (void*)ins.addr);
      //evaluate code at jump
      code_t* code2 = code - (adr - ins.addr);
      evaluate_code(code2, ins.addr, end - code, ehdr, balanced);
      //but also evaluate code as if no jump
      break;}

    case CALL_OP:{ //done
      //printf("%p: ", code);
      Elf64_Shdr* plt_shdr = section_by_name(ehdr, ".rela.plt");
      Elf64_Rela* plt = AT_SEC(ehdr, plt_shdr);
      //function calls jump twice, deal with that
      instruction_t ins2 = {ins.op, ins.length, ins.addr};
      //decode where this 2nd jump leads to
      code_t* code2 = code - (adr - ins.addr);
      //printf("j1: from %p to %p, or %p to %p\n", (void*)adr, (void*)ins.addr, code, code2);
      decode(&ins2, code2, ins2.addr);
      //printf("j2: from %p to %p, or %p to ??\n", (void*)ins.addr, (void*)ins2.addr, code2);
      char* name;
      int i;
      for (i = 0; i < plt_shdr->sh_size/sizeof(Elf64_Rela); i++) {
        if (plt[i].r_offset == ins2.addr) {
          //this is the called function, find its name
          int m = ELF64_R_SYM(plt[i].r_info);
          char* strs = AT_SEC(ehdr, section_by_name(ehdr, ".dynstr"));
          Elf64_Sym* syms = AT_SEC(ehdr, section_by_name(ehdr, ".dynsym"));
          name = strs + syms[m].st_name;

          if (strcmp(name, "open_it") == 0) {
            if (!balanced) {
              //double call of open_it, insert crash
              //printf("double call of open_it, crashing\n");
              replace_with_crash(code, &ins);
              return;
            } else {
              //printf("called open_it properly\n");
              balanced = 0;
              break;
            }
          } else if (strcmp(name, "close_it") == 0) {
            if (!balanced) {
              //printf("called close_it properly\n");
              balanced = 1;
              break;
            } else {
              //printf("double call of close_it, crashing\n");
              replace_with_crash(code, &ins);
              return;
            }
          }
        }
      }
      //printf("?\n");
      break;}

    case RET_OP: //done
      //check to make sure opens and closes are balanced
      if (balanced) {
        //printf("%p: balanced return\n", code);
        return;
      } else {
        //insert crash
        //printf("%p: unbalanced return, crashing\n", code);
        replace_with_crash(code, &ins);
        return;
      }
      break;

    case OTHER_OP: //done
      //ignore
      //printf("%p: ignored\n", code);
      break;
    }

    code += ins.length;
    adr += ins.length;
  }
  return;
}

//ehdr - pointer to in-memory copy of the destination ELF file
void enforce(Elf64_Ehdr *ehdr) {
  Elf64_Shdr* shdrs = (void*)ehdr + ehdr->e_shoff;
  Elf64_Shdr* dynsym_shdr = section_by_name(ehdr, ".dynsym");
  Elf64_Sym* syms = AT_SEC(ehdr, dynsym_shdr);
  char *strs = AT_SEC(ehdr, section_by_name(ehdr, ".dynstr"));

  int i, count = dynsym_shdr->sh_size / sizeof(Elf64_Sym);
  for (i = 0; i < count; i++) {
    if (ELF64_ST_TYPE(syms[i].st_info) == STT_FUNC && syms[i].st_size > 0) {
      printf("\n>>Modifying %s\n", strs + syms[i].st_name);
      int j = syms[i].st_shndx;
      evaluate_code(AT_SEC(ehdr, shdrs + j) + (syms[i].st_value - shdrs[j].sh_addr), syms[i].st_value, (int)syms[i].st_size, ehdr, 1);
    }
  }
}


/*************************************************************/

static void fail(char *reason, int err_code) {
  fprintf(stderr, "%s (%d)\n", reason, err_code);
  exit(1);
}

static void check_for_shared_object(Elf64_Ehdr *ehdr) {
  if ((ehdr->e_ident[EI_MAG0] != ELFMAG0)
      || (ehdr->e_ident[EI_MAG1] != ELFMAG1)
      || (ehdr->e_ident[EI_MAG2] != ELFMAG2)
      || (ehdr->e_ident[EI_MAG3] != ELFMAG3))
    fail("not an ELF file", 0);

  if (ehdr->e_ident[EI_CLASS] != ELFCLASS64)
    fail("not a 64-bit ELF file", 0);

  if (ehdr->e_type != ET_DYN)
    fail("not a shared-object file", 0);
}

int main(int argc, char **argv) {
  int fd_in, fd_out;
  size_t len;
  void *p_in, *p_out;
  Elf64_Ehdr *ehdr;

  if (argc != 3)
    fail("expected two file names on the command line", 0);

  /* Open the shared-library input file */
  fd_in = open(argv[1], O_RDONLY);
  if (fd_in == -1)
    fail("could not open input file", errno);

  /* Find out how big the input file is: */
  len = lseek(fd_in, 0, SEEK_END);

  /* Map the input file into memory: */
  p_in = mmap(NULL, len, PROT_READ, MAP_PRIVATE, fd_in, 0);
  if (p_in == (void*)-1)
    fail("mmap input failed", errno);

  /* Since the ELF file starts with an ELF header, the in-memory image
     can be cast to a `Elf64_Ehdr *` to inspect it: */
  ehdr = (Elf64_Ehdr *)p_in;

  /* Check that we have the right kind of file: */
  check_for_shared_object(ehdr);

  /* Open the shared-library output file and set its size: */
  fd_out = open(argv[2], O_RDWR | O_CREAT, 0777);
  if (fd_out == -1)
    fail("could not open output file", errno);
  if (ftruncate(fd_out, len))
    fail("could not set output file file", errno);

  /* Map the output file into memory: */
  p_out = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd_out, 0);
  if (p_out == (void*)-1)
    fail("mmap output failed", errno);

  /* Copy input file to output file: */
  memcpy(p_out, p_in, len);

  /* Close input */
  if (munmap(p_in, len))
    fail("munmap input failed", errno);
  if (close(fd_in))
    fail("close input failed", errno);

  ehdr = (Elf64_Ehdr *)p_out;

  enforce(ehdr);

  if (munmap(p_out, len))
    fail("munmap input failed", errno);
  if (close(fd_out))
    fail("close input failed", errno);

  return 0;
}
