#include "mm.h"

#define ALIGNMENT 16
//#define ALIGN(size) (((size) + (ALIGNMENT-1)) & ~(ALIGNMENT-1))

#define OVERHEAD (sizeof(block_header) + sizeof(block_footer))
//#define HDRP(bp) ((char *)(bp) - sizeof(block_header))

//#define GET_SIZE(p)  ((block_header *)(p))->size
//#define GET_ALLOC(p) ((block_header *)(p))->allocated

//#define NEXT_BLKP(bp) ((char *)(bp) + GET_SIZE(HDRP(bp)))

typedef struct {
  int size;
  char allocated;
} block_header;

typedef struct {
  int size;
  int filler;
} block_footer;

char* first_bp;
char* last_bp;

static int align(int size) {
  return (size + (ALIGNMENT-1)) & ~(ALIGNMENT-1);
}

static size_t get_size(block_header* bp) {
  return bp->size;
}

//gets header assuming bp points to the end of the header
static block_header* hdrp(char* bp) {
  return (block_header*)(bp - sizeof(block_header));
}

//gets footer assuming bp points to the end of the header
static block_footer* ftrp(char* bp) {
  return (block_footer*)(bp + get_size(hdrp(bp)) - OVERHEAD);
}
/*
static size_t get_size(block_footer* bp) {
  return bp->size;
}
*/
static size_t get_alloc(block_header* bp) {
  return bp->allocated;
}

static char* next_blkp(char* bp) {
  size_t size = get_size(hdrp(bp));
  return bp + size;
}

static char* prev_blkp(char* bp) {
  return bp - get_size((block_header*)(bp - OVERHEAD));
}

void mm_init(void *heap, size_t heap_size)
{
  char *bp;

  bp = (char*)heap + sizeof(block_header) + sizeof(double); //probably not the best way to add 8 more bytes

  last_bp = (char*)heap + heap_size;

  //create terminator block
  block_header* term;
  term = hdrp(last_bp);
  term->size = 0;
  term->allocated = 1;

  //give bp soem values
  hdrp(bp)->size = heap_size - OVERHEAD;
  hdrp(bp)->allocated = 0;
  ftrp(bp)->size = heap_size - OVERHEAD;

  first_bp = bp;

  //create prologue block
  mm_malloc(0);
}

static void set_allocated(void *bp, size_t size)
{
  size_t extra_size = get_size(hdrp(bp)) - size;

  if (extra_size > align(1 + OVERHEAD)) {
    hdrp(bp)->size = size;
    ftrp(bp)->size = size;
    block_header* hdr;
    hdr = hdrp(next_blkp(bp));
    hdr->size = extra_size;
    hdr->allocated = 0;
    block_footer* ftr;
    ftr = ftrp(next_blkp(bp));
    ftr->size = extra_size;
  }

  hdrp(bp)->allocated = 1;
}

void *mm_malloc(size_t size)
{
  int new_size = align(size + OVERHEAD);
  char* bp = first_bp;

  while(get_size(hdrp(bp)) != 0) {
    if (!get_alloc(hdrp(bp)) && (get_size(hdrp(bp)) >= new_size)) {
      set_allocated(bp, new_size);
      return bp;
    }
    bp = next_blkp(bp);
  }

  //return null if there's no space
  return NULL;
}

void coalesce(void* bp) {
  char prev_alloc = get_alloc(hdrp(prev_blkp(bp)));
  char next_alloc = get_alloc(hdrp(next_blkp(bp)));
  size_t size = get_size(hdrp(bp));

  if (prev_alloc && next_alloc) {
    //do nothing :)
  }
  else if (prev_alloc && !next_alloc) { //merge left
    size += get_size(hdrp(next_blkp(bp)));
    hdrp(bp)->size = size;
    ftrp(bp)->size = size;
  }
  else if (!prev_alloc && next_alloc) { //merge right
    size += get_size(hdrp(prev_blkp(bp)));
    ftrp(bp)->size = size;
    hdrp(prev_blkp(bp))->size = size;
    bp = prev_blkp(bp);
  }
  else { //merge both
    size += (get_size(hdrp(prev_blkp(bp))) + get_size(hdrp(next_blkp(bp))));
    hdrp(prev_blkp(bp))->size = size;
    ftrp(next_blkp(bp))->size = size;
    bp = prev_blkp(bp);
  }
}

void mm_free(void *bp)
{
  hdrp(bp)->allocated = 0;
  coalesce(bp);
}
