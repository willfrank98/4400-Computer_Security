
./bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400ab8 <_init>:
  400ab8:	48 83 ec 08          	sub    $0x8,%rsp
  400abc:	48 8b 05 35 35 20 00 	mov    0x203535(%rip),%rax        # 603ff8 <__gmon_start__>
  400ac3:	48 85 c0             	test   %rax,%rax
  400ac6:	74 05                	je     400acd <_init+0x15>
  400ac8:	e8 e3 01 00 00       	callq  400cb0 <.plt.got>
  400acd:	48 83 c4 08          	add    $0x8,%rsp
  400ad1:	c3                   	retq   

Disassembly of section .plt:

0000000000400ae0 <.plt>:
  400ae0:	ff 35 22 35 20 00    	pushq  0x203522(%rip)        # 604008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400ae6:	ff 25 24 35 20 00    	jmpq   *0x203524(%rip)        # 604010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400aec:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400af0 <getenv@plt>:
  400af0:	ff 25 22 35 20 00    	jmpq   *0x203522(%rip)        # 604018 <getenv@GLIBC_2.2.5>
  400af6:	68 00 00 00 00       	pushq  $0x0
  400afb:	e9 e0 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400b00 <strcasecmp@plt>:
  400b00:	ff 25 1a 35 20 00    	jmpq   *0x20351a(%rip)        # 604020 <strcasecmp@GLIBC_2.2.5>
  400b06:	68 01 00 00 00       	pushq  $0x1
  400b0b:	e9 d0 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400b10 <__errno_location@plt>:
  400b10:	ff 25 12 35 20 00    	jmpq   *0x203512(%rip)        # 604028 <__errno_location@GLIBC_2.2.5>
  400b16:	68 02 00 00 00       	pushq  $0x2
  400b1b:	e9 c0 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400b20 <strcpy@plt>:
  400b20:	ff 25 0a 35 20 00    	jmpq   *0x20350a(%rip)        # 604030 <strcpy@GLIBC_2.2.5>
  400b26:	68 03 00 00 00       	pushq  $0x3
  400b2b:	e9 b0 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400b30 <puts@plt>:
  400b30:	ff 25 02 35 20 00    	jmpq   *0x203502(%rip)        # 604038 <puts@GLIBC_2.2.5>
  400b36:	68 04 00 00 00       	pushq  $0x4
  400b3b:	e9 a0 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400b40 <write@plt>:
  400b40:	ff 25 fa 34 20 00    	jmpq   *0x2034fa(%rip)        # 604040 <write@GLIBC_2.2.5>
  400b46:	68 05 00 00 00       	pushq  $0x5
  400b4b:	e9 90 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400b50 <printf@plt>:
  400b50:	ff 25 f2 34 20 00    	jmpq   *0x2034f2(%rip)        # 604048 <printf@GLIBC_2.2.5>
  400b56:	68 06 00 00 00       	pushq  $0x6
  400b5b:	e9 80 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400b60 <alarm@plt>:
  400b60:	ff 25 ea 34 20 00    	jmpq   *0x2034ea(%rip)        # 604050 <alarm@GLIBC_2.2.5>
  400b66:	68 07 00 00 00       	pushq  $0x7
  400b6b:	e9 70 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400b70 <close@plt>:
  400b70:	ff 25 e2 34 20 00    	jmpq   *0x2034e2(%rip)        # 604058 <close@GLIBC_2.2.5>
  400b76:	68 08 00 00 00       	pushq  $0x8
  400b7b:	e9 60 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400b80 <read@plt>:
  400b80:	ff 25 da 34 20 00    	jmpq   *0x2034da(%rip)        # 604060 <read@GLIBC_2.2.5>
  400b86:	68 09 00 00 00       	pushq  $0x9
  400b8b:	e9 50 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400b90 <__libc_start_main@plt>:
  400b90:	ff 25 d2 34 20 00    	jmpq   *0x2034d2(%rip)        # 604068 <__libc_start_main@GLIBC_2.2.5>
  400b96:	68 0a 00 00 00       	pushq  $0xa
  400b9b:	e9 40 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400ba0 <fgets@plt>:
  400ba0:	ff 25 ca 34 20 00    	jmpq   *0x2034ca(%rip)        # 604070 <fgets@GLIBC_2.2.5>
  400ba6:	68 0b 00 00 00       	pushq  $0xb
  400bab:	e9 30 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400bb0 <signal@plt>:
  400bb0:	ff 25 c2 34 20 00    	jmpq   *0x2034c2(%rip)        # 604078 <signal@GLIBC_2.2.5>
  400bb6:	68 0c 00 00 00       	pushq  $0xc
  400bbb:	e9 20 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400bc0 <gethostbyname@plt>:
  400bc0:	ff 25 ba 34 20 00    	jmpq   *0x2034ba(%rip)        # 604080 <gethostbyname@GLIBC_2.2.5>
  400bc6:	68 0d 00 00 00       	pushq  $0xd
  400bcb:	e9 10 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400bd0 <fprintf@plt>:
  400bd0:	ff 25 b2 34 20 00    	jmpq   *0x2034b2(%rip)        # 604088 <fprintf@GLIBC_2.2.5>
  400bd6:	68 0e 00 00 00       	pushq  $0xe
  400bdb:	e9 00 ff ff ff       	jmpq   400ae0 <.plt>

0000000000400be0 <strtol@plt>:
  400be0:	ff 25 aa 34 20 00    	jmpq   *0x2034aa(%rip)        # 604090 <strtol@GLIBC_2.2.5>
  400be6:	68 0f 00 00 00       	pushq  $0xf
  400beb:	e9 f0 fe ff ff       	jmpq   400ae0 <.plt>

0000000000400bf0 <memcpy@plt>:
  400bf0:	ff 25 a2 34 20 00    	jmpq   *0x2034a2(%rip)        # 604098 <memcpy@GLIBC_2.14>
  400bf6:	68 10 00 00 00       	pushq  $0x10
  400bfb:	e9 e0 fe ff ff       	jmpq   400ae0 <.plt>

0000000000400c00 <fflush@plt>:
  400c00:	ff 25 9a 34 20 00    	jmpq   *0x20349a(%rip)        # 6040a0 <fflush@GLIBC_2.2.5>
  400c06:	68 11 00 00 00       	pushq  $0x11
  400c0b:	e9 d0 fe ff ff       	jmpq   400ae0 <.plt>

0000000000400c10 <__isoc99_sscanf@plt>:
  400c10:	ff 25 92 34 20 00    	jmpq   *0x203492(%rip)        # 6040a8 <__isoc99_sscanf@GLIBC_2.7>
  400c16:	68 12 00 00 00       	pushq  $0x12
  400c1b:	e9 c0 fe ff ff       	jmpq   400ae0 <.plt>

0000000000400c20 <bcopy@plt>:
  400c20:	ff 25 8a 34 20 00    	jmpq   *0x20348a(%rip)        # 6040b0 <bcopy@GLIBC_2.2.5>
  400c26:	68 13 00 00 00       	pushq  $0x13
  400c2b:	e9 b0 fe ff ff       	jmpq   400ae0 <.plt>

0000000000400c30 <fopen@plt>:
  400c30:	ff 25 82 34 20 00    	jmpq   *0x203482(%rip)        # 6040b8 <fopen@GLIBC_2.2.5>
  400c36:	68 14 00 00 00       	pushq  $0x14
  400c3b:	e9 a0 fe ff ff       	jmpq   400ae0 <.plt>

0000000000400c40 <gethostname@plt>:
  400c40:	ff 25 7a 34 20 00    	jmpq   *0x20347a(%rip)        # 6040c0 <gethostname@GLIBC_2.2.5>
  400c46:	68 15 00 00 00       	pushq  $0x15
  400c4b:	e9 90 fe ff ff       	jmpq   400ae0 <.plt>

0000000000400c50 <sprintf@plt>:
  400c50:	ff 25 72 34 20 00    	jmpq   *0x203472(%rip)        # 6040c8 <sprintf@GLIBC_2.2.5>
  400c56:	68 16 00 00 00       	pushq  $0x16
  400c5b:	e9 80 fe ff ff       	jmpq   400ae0 <.plt>

0000000000400c60 <exit@plt>:
  400c60:	ff 25 6a 34 20 00    	jmpq   *0x20346a(%rip)        # 6040d0 <exit@GLIBC_2.2.5>
  400c66:	68 17 00 00 00       	pushq  $0x17
  400c6b:	e9 70 fe ff ff       	jmpq   400ae0 <.plt>

0000000000400c70 <connect@plt>:
  400c70:	ff 25 62 34 20 00    	jmpq   *0x203462(%rip)        # 6040d8 <connect@GLIBC_2.2.5>
  400c76:	68 18 00 00 00       	pushq  $0x18
  400c7b:	e9 60 fe ff ff       	jmpq   400ae0 <.plt>

0000000000400c80 <sleep@plt>:
  400c80:	ff 25 5a 34 20 00    	jmpq   *0x20345a(%rip)        # 6040e0 <sleep@GLIBC_2.2.5>
  400c86:	68 19 00 00 00       	pushq  $0x19
  400c8b:	e9 50 fe ff ff       	jmpq   400ae0 <.plt>

0000000000400c90 <__ctype_b_loc@plt>:
  400c90:	ff 25 52 34 20 00    	jmpq   *0x203452(%rip)        # 6040e8 <__ctype_b_loc@GLIBC_2.3>
  400c96:	68 1a 00 00 00       	pushq  $0x1a
  400c9b:	e9 40 fe ff ff       	jmpq   400ae0 <.plt>

0000000000400ca0 <socket@plt>:
  400ca0:	ff 25 4a 34 20 00    	jmpq   *0x20344a(%rip)        # 6040f0 <socket@GLIBC_2.2.5>
  400ca6:	68 1b 00 00 00       	pushq  $0x1b
  400cab:	e9 30 fe ff ff       	jmpq   400ae0 <.plt>

Disassembly of section .plt.got:

0000000000400cb0 <.plt.got>:
  400cb0:	ff 25 42 33 20 00    	jmpq   *0x203342(%rip)        # 603ff8 <__gmon_start__>
  400cb6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400cc0 <_start>:
  400cc0:	31 ed                	xor    %ebp,%ebp
  400cc2:	49 89 d1             	mov    %rdx,%r9
  400cc5:	5e                   	pop    %rsi
  400cc6:	48 89 e2             	mov    %rsp,%rdx
  400cc9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400ccd:	50                   	push   %rax
  400cce:	54                   	push   %rsp
  400ccf:	49 c7 c0 20 23 40 00 	mov    $0x402320,%r8
  400cd6:	48 c7 c1 b0 22 40 00 	mov    $0x4022b0,%rcx
  400cdd:	48 c7 c7 ad 0d 40 00 	mov    $0x400dad,%rdi
  400ce4:	e8 a7 fe ff ff       	callq  400b90 <__libc_start_main@plt>
  400ce9:	f4                   	hlt    
  400cea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400cf0 <deregister_tm_clones>:
  400cf0:	b8 87 47 60 00       	mov    $0x604787,%eax
  400cf5:	55                   	push   %rbp
  400cf6:	48 2d 80 47 60 00    	sub    $0x604780,%rax
  400cfc:	48 83 f8 0e          	cmp    $0xe,%rax
  400d00:	48 89 e5             	mov    %rsp,%rbp
  400d03:	77 02                	ja     400d07 <deregister_tm_clones+0x17>
  400d05:	5d                   	pop    %rbp
  400d06:	c3                   	retq   
  400d07:	b8 00 00 00 00       	mov    $0x0,%eax
  400d0c:	48 85 c0             	test   %rax,%rax
  400d0f:	74 f4                	je     400d05 <deregister_tm_clones+0x15>
  400d11:	5d                   	pop    %rbp
  400d12:	bf 80 47 60 00       	mov    $0x604780,%edi
  400d17:	ff e0                	jmpq   *%rax
  400d19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400d20 <register_tm_clones>:
  400d20:	b8 80 47 60 00       	mov    $0x604780,%eax
  400d25:	55                   	push   %rbp
  400d26:	48 2d 80 47 60 00    	sub    $0x604780,%rax
  400d2c:	48 c1 f8 03          	sar    $0x3,%rax
  400d30:	48 89 e5             	mov    %rsp,%rbp
  400d33:	48 89 c2             	mov    %rax,%rdx
  400d36:	48 c1 ea 3f          	shr    $0x3f,%rdx
  400d3a:	48 01 d0             	add    %rdx,%rax
  400d3d:	48 d1 f8             	sar    %rax
  400d40:	75 02                	jne    400d44 <register_tm_clones+0x24>
  400d42:	5d                   	pop    %rbp
  400d43:	c3                   	retq   
  400d44:	ba 00 00 00 00       	mov    $0x0,%edx
  400d49:	48 85 d2             	test   %rdx,%rdx
  400d4c:	74 f4                	je     400d42 <register_tm_clones+0x22>
  400d4e:	5d                   	pop    %rbp
  400d4f:	48 89 c6             	mov    %rax,%rsi
  400d52:	bf 80 47 60 00       	mov    $0x604780,%edi
  400d57:	ff e2                	jmpq   *%rdx
  400d59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400d60 <__do_global_dtors_aux>:
  400d60:	80 3d 31 3a 20 00 00 	cmpb   $0x0,0x203a31(%rip)        # 604798 <completed.6355>
  400d67:	75 11                	jne    400d7a <__do_global_dtors_aux+0x1a>
  400d69:	55                   	push   %rbp
  400d6a:	48 89 e5             	mov    %rsp,%rbp
  400d6d:	e8 7e ff ff ff       	callq  400cf0 <deregister_tm_clones>
  400d72:	5d                   	pop    %rbp
  400d73:	c6 05 1e 3a 20 00 01 	movb   $0x1,0x203a1e(%rip)        # 604798 <completed.6355>
  400d7a:	f3 c3                	repz retq 
  400d7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400d80 <frame_dummy>:
  400d80:	48 83 3d 98 30 20 00 	cmpq   $0x0,0x203098(%rip)        # 603e20 <__JCR_END__>
  400d87:	00 
  400d88:	74 1e                	je     400da8 <frame_dummy+0x28>
  400d8a:	b8 00 00 00 00       	mov    $0x0,%eax
  400d8f:	48 85 c0             	test   %rax,%rax
  400d92:	74 14                	je     400da8 <frame_dummy+0x28>
  400d94:	55                   	push   %rbp
  400d95:	bf 20 3e 60 00       	mov    $0x603e20,%edi
  400d9a:	48 89 e5             	mov    %rsp,%rbp
  400d9d:	ff d0                	callq  *%rax
  400d9f:	5d                   	pop    %rbp
  400da0:	e9 7b ff ff ff       	jmpq   400d20 <register_tm_clones>
  400da5:	0f 1f 00             	nopl   (%rax)
  400da8:	e9 73 ff ff ff       	jmpq   400d20 <register_tm_clones>

0000000000400dad <main>:
  400dad:	53                   	push   %rbx
  400dae:	83 ff 01             	cmp    $0x1,%edi
  400db1:	75 10                	jne    400dc3 <main+0x16>
  400db3:	48 8b 05 ce 39 20 00 	mov    0x2039ce(%rip),%rax        # 604788 <stdin@@GLIBC_2.2.5>
  400dba:	48 89 05 df 39 20 00 	mov    %rax,0x2039df(%rip)        # 6047a0 <infile>
  400dc1:	eb 59                	jmp    400e1c <main+0x6f>
  400dc3:	48 89 f3             	mov    %rsi,%rbx
  400dc6:	83 ff 02             	cmp    $0x2,%edi
  400dc9:	75 35                	jne    400e00 <main+0x53>
  400dcb:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  400dcf:	be 50 23 40 00       	mov    $0x402350,%esi
  400dd4:	e8 57 fe ff ff       	callq  400c30 <fopen@plt>
  400dd9:	48 89 05 c0 39 20 00 	mov    %rax,0x2039c0(%rip)        # 6047a0 <infile>
  400de0:	48 85 c0             	test   %rax,%rax
  400de3:	75 37                	jne    400e1c <main+0x6f>
  400de5:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  400de9:	48 8b 33             	mov    (%rbx),%rsi
  400dec:	bf 52 23 40 00       	mov    $0x402352,%edi
  400df1:	e8 5a fd ff ff       	callq  400b50 <printf@plt>
  400df6:	bf 08 00 00 00       	mov    $0x8,%edi
  400dfb:	e8 60 fe ff ff       	callq  400c60 <exit@plt>
  400e00:	48 8b 36             	mov    (%rsi),%rsi
  400e03:	bf 6f 23 40 00       	mov    $0x40236f,%edi
  400e08:	b8 00 00 00 00       	mov    $0x0,%eax
  400e0d:	e8 3e fd ff ff       	callq  400b50 <printf@plt>
  400e12:	bf 08 00 00 00       	mov    $0x8,%edi
  400e17:	e8 44 fe ff ff       	callq  400c60 <exit@plt>
  400e1c:	e8 26 05 00 00       	callq  401347 <initialize_bomb>
  400e21:	bf d8 23 40 00       	mov    $0x4023d8,%edi
  400e26:	e8 05 fd ff ff       	callq  400b30 <puts@plt>
  400e2b:	bf 18 24 40 00       	mov    $0x402418,%edi
  400e30:	e8 fb fc ff ff       	callq  400b30 <puts@plt>
  400e35:	e8 82 07 00 00       	callq  4015bc <read_line>
  400e3a:	48 89 c7             	mov    %rax,%rdi
  400e3d:	e8 9e 00 00 00       	callq  400ee0 <phase_1>
  400e42:	e8 9b 08 00 00       	callq  4016e2 <phase_defused>
  400e47:	bf 48 24 40 00       	mov    $0x402448,%edi
  400e4c:	e8 df fc ff ff       	callq  400b30 <puts@plt>
  400e51:	e8 66 07 00 00       	callq  4015bc <read_line>
  400e56:	48 89 c7             	mov    %rax,%rdi
  400e59:	e8 9e 00 00 00       	callq  400efc <phase_2>
  400e5e:	e8 7f 08 00 00       	callq  4016e2 <phase_defused>
  400e63:	bf 89 23 40 00       	mov    $0x402389,%edi
  400e68:	e8 c3 fc ff ff       	callq  400b30 <puts@plt>
  400e6d:	e8 4a 07 00 00       	callq  4015bc <read_line>
  400e72:	48 89 c7             	mov    %rax,%rdi
  400e75:	e8 c9 00 00 00       	callq  400f43 <phase_3>
  400e7a:	e8 63 08 00 00       	callq  4016e2 <phase_defused>
  400e7f:	bf a7 23 40 00       	mov    $0x4023a7,%edi
  400e84:	e8 a7 fc ff ff       	callq  400b30 <puts@plt>
  400e89:	e8 2e 07 00 00       	callq  4015bc <read_line>
  400e8e:	48 89 c7             	mov    %rax,%rdi
  400e91:	e8 6b 01 00 00       	callq  401001 <phase_4>
  400e96:	e8 47 08 00 00       	callq  4016e2 <phase_defused>
  400e9b:	bf 78 24 40 00       	mov    $0x402478,%edi
  400ea0:	e8 8b fc ff ff       	callq  400b30 <puts@plt>
  400ea5:	e8 12 07 00 00       	callq  4015bc <read_line>
  400eaa:	48 89 c7             	mov    %rax,%rdi
  400ead:	e8 a6 01 00 00       	callq  401058 <phase_5>
  400eb2:	e8 2b 08 00 00       	callq  4016e2 <phase_defused>
  400eb7:	bf b6 23 40 00       	mov    $0x4023b6,%edi
  400ebc:	e8 6f fc ff ff       	callq  400b30 <puts@plt>
  400ec1:	e8 f6 06 00 00       	callq  4015bc <read_line>
  400ec6:	48 89 c7             	mov    %rax,%rdi
  400ec9:	e8 f7 01 00 00       	callq  4010c5 <phase_6>
  400ece:	e8 0f 08 00 00       	callq  4016e2 <phase_defused>
  400ed3:	b8 00 00 00 00       	mov    $0x0,%eax
  400ed8:	5b                   	pop    %rbx
  400ed9:	c3                   	retq   
  400eda:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400ee0 <phase_1>:
  400ee0:	48 83 ec 08          	sub    $0x8,%rsp
  400ee4:	be a0 24 40 00       	mov    $0x4024a0,%esi
  400ee9:	e8 f0 03 00 00       	callq  4012de <strings_not_equal>
  400eee:	85 c0                	test   %eax,%eax
  400ef0:	74 05                	je     400ef7 <phase_1+0x17>
  400ef2:	e8 4d 06 00 00       	callq  401544 <explode_bomb>
  400ef7:	48 83 c4 08          	add    $0x8,%rsp
  400efb:	c3                   	retq   

0000000000400efc <phase_2>:
  400efc:	55                   	push   %rbp                         decrement %rsp by 4 and copy %rbp there
  400efd:	53                   	push   %rbx                         same, but %rbx
  400efe:	48 83 ec 28          	sub    $0x28,%rsp                   subtracts 40 from %rsp
  400f02:	48 89 e6             	mov    %rsp,%rsi                    
  400f05:	e8 70 06 00 00       	callq  40157a <read_six_numbers>
  400f0a:	83 3c 24 01          	cmpl   $0x1,(%rsp)
  400f0e:	74 20                	je     400f30 <phase_2+0x34>
  400f10:	e8 2f 06 00 00       	callq  401544 <explode_bomb>
  400f15:	eb 19                	jmp    400f30 <phase_2+0x34>
  400f17:	8b 43 fc             	mov    -0x4(%rbx),%eax
  400f1a:	01 c0                	add    %eax,%eax
  400f1c:	39 03                	cmp    %eax,(%rbx)
  400f1e:	74 05                	je     400f25 <phase_2+0x29>
  400f20:	e8 1f 06 00 00       	callq  401544 <explode_bomb>
  400f25:	48 83 c3 04          	add    $0x4,%rbx
  400f29:	48 39 eb             	cmp    %rbp,%rbx
  400f2c:	75 e9                	jne    400f17 <phase_2+0x1b>
  400f2e:	eb 0c                	jmp    400f3c <phase_2+0x40>
  400f30:	48 8d 5c 24 04       	lea    0x4(%rsp),%rbx
  400f35:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
  400f3a:	eb db                	jmp    400f17 <phase_2+0x1b>
  400f3c:	48 83 c4 28          	add    $0x28,%rsp
  400f40:	5b                   	pop    %rbx
  400f41:	5d                   	pop    %rbp
  400f42:	c3                   	retq   

0000000000400f43 <phase_3>:
  400f43:	48 83 ec 18          	sub    $0x18,%rsp                   subtract 24 from rsp
  400f47:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  400f4c:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  400f51:	be cd 27 40 00       	mov    $0x4027cd,%esi
  400f56:	b8 00 00 00 00       	mov    $0x0,%eax
  400f5b:	e8 b0 fc ff ff       	callq  400c10 <__isoc99_sscanf@plt>
  400f60:	83 f8 01             	cmp    $0x1,%eax                    needs at least 2(?) words
  400f63:	7f 05                	jg     400f6a <phase_3+0x27>
  400f65:	e8 da 05 00 00       	callq  401544 <explode_bomb>
  400f6a:	83 7c 24 0c 07       	cmpl   $0x7,0xc(%rsp)
  400f6f:	77 3c                	ja     400fad <phase_3+0x6a>
  400f71:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  400f75:	ff 24 c5 00 25 40 00 	jmpq   *0x402500(,%rax,8)
  400f7c:	b8 c5 00 00 00       	mov    $0xc5,%eax
  400f81:	eb 3b                	jmp    400fbe <phase_3+0x7b>
  400f83:	b8 4f 00 00 00       	mov    $0x4f,%eax
  400f88:	eb 34                	jmp    400fbe <phase_3+0x7b>
  400f8a:	b8 d2 00 00 00       	mov    $0xd2,%eax
  400f8f:	eb 2d                	jmp    400fbe <phase_3+0x7b>
  400f91:	b8 68 03 00 00       	mov    $0x368,%eax
  400f96:	eb 26                	jmp    400fbe <phase_3+0x7b>
  400f98:	b8 5e 00 00 00       	mov    $0x5e,%eax
  400f9d:	eb 1f                	jmp    400fbe <phase_3+0x7b>
  400f9f:	b8 ac 03 00 00       	mov    $0x3ac,%eax
  400fa4:	eb 18                	jmp    400fbe <phase_3+0x7b>
  400fa6:	b8 c2 01 00 00       	mov    $0x1c2,%eax
  400fab:	eb 11                	jmp    400fbe <phase_3+0x7b>
  400fad:	e8 92 05 00 00       	callq  401544 <explode_bomb>
  400fb2:	b8 00 00 00 00       	mov    $0x0,%eax
  400fb7:	eb 05                	jmp    400fbe <phase_3+0x7b>
  400fb9:	b8 cc 00 00 00       	mov    $0xcc,%eax
  400fbe:	3b 44 24 08          	cmp    0x8(%rsp),%eax
  400fc2:	74 05                	je     400fc9 <phase_3+0x86>
  400fc4:	e8 7b 05 00 00       	callq  401544 <explode_bomb>
  400fc9:	48 83 c4 18          	add    $0x18,%rsp
  400fcd:	c3                   	retq   

0000000000400fce <func4>:
  400fce:	53                   	push   %rbx
  400fcf:	89 d0                	mov    %edx,%eax
  400fd1:	29 f0                	sub    %esi,%eax
  400fd3:	89 c3                	mov    %eax,%ebx
  400fd5:	c1 eb 1f             	shr    $0x1f,%ebx
  400fd8:	01 d8                	add    %ebx,%eax
  400fda:	d1 f8                	sar    %eax
  400fdc:	8d 1c 30             	lea    (%rax,%rsi,1),%ebx
  400fdf:	39 fb                	cmp    %edi,%ebx
  400fe1:	7e 0c                	jle    400fef <func4+0x21>
  400fe3:	8d 53 ff             	lea    -0x1(%rbx),%edx
  400fe6:	e8 e3 ff ff ff       	callq  400fce <func4>
  400feb:	01 d8                	add    %ebx,%eax
  400fed:	eb 10                	jmp    400fff <func4+0x31>
  400fef:	89 d8                	mov    %ebx,%eax
  400ff1:	39 fb                	cmp    %edi,%ebx
  400ff3:	7d 0a                	jge    400fff <func4+0x31>
  400ff5:	8d 73 01             	lea    0x1(%rbx),%esi
  400ff8:	e8 d1 ff ff ff       	callq  400fce <func4>
  400ffd:	01 d8                	add    %ebx,%eax
  400fff:	5b                   	pop    %rbx
  401000:	c3                   	retq   

0000000000401001 <phase_4>:
  401001:	48 83 ec 18          	sub    $0x18,%rsp
  401005:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  40100a:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  40100f:	be cd 27 40 00       	mov    $0x4027cd,%esi
  401014:	b8 00 00 00 00       	mov    $0x0,%eax
  401019:	e8 f2 fb ff ff       	callq  400c10 <__isoc99_sscanf@plt>
  40101e:	83 f8 02             	cmp    $0x2,%eax
  401021:	75 07                	jne    40102a <phase_4+0x29>
  401023:	83 7c 24 0c 0e       	cmpl   $0xe,0xc(%rsp)
  401028:	76 05                	jbe    40102f <phase_4+0x2e>
  40102a:	e8 15 05 00 00       	callq  401544 <explode_bomb>
  40102f:	ba 0e 00 00 00       	mov    $0xe,%edx
  401034:	be 00 00 00 00       	mov    $0x0,%esi
  401039:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
  40103d:	e8 8c ff ff ff       	callq  400fce <func4>
  401042:	83 f8 13             	cmp    $0x13,%eax
  401045:	75 07                	jne    40104e <phase_4+0x4d>
  401047:	83 7c 24 08 13       	cmpl   $0x13,0x8(%rsp)
  40104c:	74 05                	je     401053 <phase_4+0x52>
  40104e:	e8 f1 04 00 00       	callq  401544 <explode_bomb>
  401053:	48 83 c4 18          	add    $0x18,%rsp
  401057:	c3                   	retq   

0000000000401058 <phase_5>:
  401058:	48 83 ec 18          	sub    $0x18,%rsp
  40105c:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  401061:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  401066:	be cd 27 40 00       	mov    $0x4027cd,%esi
  40106b:	b8 00 00 00 00       	mov    $0x0,%eax
  401070:	e8 9b fb ff ff       	callq  400c10 <__isoc99_sscanf@plt>
  401075:	83 f8 01             	cmp    $0x1,%eax
  401078:	7f 05                	jg     40107f <phase_5+0x27>
  40107a:	e8 c5 04 00 00       	callq  401544 <explode_bomb>
  40107f:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401083:	83 e0 0f             	and    $0xf,%eax
  401086:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40108a:	83 f8 0f             	cmp    $0xf,%eax
  40108d:	74 2c                	je     4010bb <phase_5+0x63>
  40108f:	b9 00 00 00 00       	mov    $0x0,%ecx
  401094:	ba 00 00 00 00       	mov    $0x0,%edx
  401099:	83 c2 01             	add    $0x1,%edx
  40109c:	48 98                	cltq   
  40109e:	8b 04 85 40 25 40 00 	mov    0x402540(,%rax,4),%eax
  4010a5:	01 c1                	add    %eax,%ecx
  4010a7:	83 f8 0f             	cmp    $0xf,%eax
  4010aa:	75 ed                	jne    401099 <phase_5+0x41>
  4010ac:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4010b0:	83 fa 0f             	cmp    $0xf,%edx
  4010b3:	75 06                	jne    4010bb <phase_5+0x63>
  4010b5:	3b 4c 24 08          	cmp    0x8(%rsp),%ecx
  4010b9:	74 05                	je     4010c0 <phase_5+0x68>
  4010bb:	e8 84 04 00 00       	callq  401544 <explode_bomb>
  4010c0:	48 83 c4 18          	add    $0x18,%rsp
  4010c4:	c3                   	retq   

00000000004010c5 <phase_6>:
  4010c5:	41 55                	push   %r13
  4010c7:	41 54                	push   %r12
  4010c9:	55                   	push   %rbp
  4010ca:	53                   	push   %rbx
  4010cb:	48 83 ec 58          	sub    $0x58,%rsp
  4010cf:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  4010d4:	e8 a1 04 00 00       	callq  40157a <read_six_numbers>
  4010d9:	4c 8d 6c 24 30       	lea    0x30(%rsp),%r13
  4010de:	41 bc 00 00 00 00    	mov    $0x0,%r12d
  4010e4:	4c 89 ed             	mov    %r13,%rbp
  4010e7:	41 8b 45 00          	mov    0x0(%r13),%eax
  4010eb:	83 e8 01             	sub    $0x1,%eax
  4010ee:	83 f8 05             	cmp    $0x5,%eax
  4010f1:	76 05                	jbe    4010f8 <phase_6+0x33>
  4010f3:	e8 4c 04 00 00       	callq  401544 <explode_bomb>
  4010f8:	41 83 c4 01          	add    $0x1,%r12d
  4010fc:	41 83 fc 06          	cmp    $0x6,%r12d
  401100:	75 07                	jne    401109 <phase_6+0x44>
  401102:	be 00 00 00 00       	mov    $0x0,%esi
  401107:	eb 42                	jmp    40114b <phase_6+0x86>
  401109:	44 89 e3             	mov    %r12d,%ebx
  40110c:	48 63 c3             	movslq %ebx,%rax
  40110f:	8b 44 84 30          	mov    0x30(%rsp,%rax,4),%eax
  401113:	39 45 00             	cmp    %eax,0x0(%rbp)
  401116:	75 05                	jne    40111d <phase_6+0x58>
  401118:	e8 27 04 00 00       	callq  401544 <explode_bomb>
  40111d:	83 c3 01             	add    $0x1,%ebx
  401120:	83 fb 05             	cmp    $0x5,%ebx
  401123:	7e e7                	jle    40110c <phase_6+0x47>
  401125:	49 83 c5 04          	add    $0x4,%r13
  401129:	eb b9                	jmp    4010e4 <phase_6+0x1f>
  40112b:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  40112f:	83 c0 01             	add    $0x1,%eax
  401132:	39 c8                	cmp    %ecx,%eax
  401134:	75 f5                	jne    40112b <phase_6+0x66>
  401136:	eb 05                	jmp    40113d <phase_6+0x78>
  401138:	ba f0 42 60 00       	mov    $0x6042f0,%edx
  40113d:	48 89 14 74          	mov    %rdx,(%rsp,%rsi,2)
  401141:	48 83 c6 04          	add    $0x4,%rsi
  401145:	48 83 fe 18          	cmp    $0x18,%rsi
  401149:	74 15                	je     401160 <phase_6+0x9b>
  40114b:	8b 4c 34 30          	mov    0x30(%rsp,%rsi,1),%ecx
  40114f:	83 f9 01             	cmp    $0x1,%ecx
  401152:	7e e4                	jle    401138 <phase_6+0x73>
  401154:	b8 01 00 00 00       	mov    $0x1,%eax
  401159:	ba f0 42 60 00       	mov    $0x6042f0,%edx
  40115e:	eb cb                	jmp    40112b <phase_6+0x66>
  401160:	48 8b 1c 24          	mov    (%rsp),%rbx
  401164:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
  401169:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  40116e:	48 89 d9             	mov    %rbx,%rcx
  401171:	48 8b 10             	mov    (%rax),%rdx
  401174:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  401178:	48 83 c0 08          	add    $0x8,%rax
  40117c:	48 39 f0             	cmp    %rsi,%rax
  40117f:	74 05                	je     401186 <phase_6+0xc1>
  401181:	48 89 d1             	mov    %rdx,%rcx
  401184:	eb eb                	jmp    401171 <phase_6+0xac>
  401186:	48 c7 42 08 00 00 00 	movq   $0x0,0x8(%rdx)
  40118d:	00
  40118e:	bd 05 00 00 00       	mov    $0x5,%ebp
  401193:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401197:	8b 00                	mov    (%rax),%eax
  401199:	39 03                	cmp    %eax,(%rbx)
  40119b:	7e 05                	jle    4011a2 <phase_6+0xdd>
  40119d:	e8 a2 03 00 00       	callq  401544 <explode_bomb>
  4011a2:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  4011a6:	83 ed 01             	sub    $0x1,%ebp
  4011a9:	75 e8                	jne    401193 <phase_6+0xce>
  4011ab:	48 83 c4 58          	add    $0x58,%rsp
  4011af:	5b                   	pop    %rbx
  4011b0:	5d                   	pop    %rbp
  4011b1:	41 5c                	pop    %r12
  4011b3:	41 5d                	pop    %r13
  4011b5:	c3                   	retq   

00000000004011b6 <fun7>:
  4011b6:	48 83 ec 08          	sub    $0x8,%rsp
  4011ba:	48 85 ff             	test   %rdi,%rdi
  4011bd:	74 2b                	je     4011ea <fun7+0x34>
  4011bf:	8b 17                	mov    (%rdi),%edx
  4011c1:	39 f2                	cmp    %esi,%edx
  4011c3:	7e 0d                	jle    4011d2 <fun7+0x1c>
  4011c5:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  4011c9:	e8 e8 ff ff ff       	callq  4011b6 <fun7>
  4011ce:	01 c0                	add    %eax,%eax
  4011d0:	eb 1d                	jmp    4011ef <fun7+0x39>
  4011d2:	b8 00 00 00 00       	mov    $0x0,%eax
  4011d7:	39 f2                	cmp    %esi,%edx
  4011d9:	74 14                	je     4011ef <fun7+0x39>
  4011db:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  4011df:	e8 d2 ff ff ff       	callq  4011b6 <fun7>
  4011e4:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  4011e8:	eb 05                	jmp    4011ef <fun7+0x39>
  4011ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4011ef:	48 83 c4 08          	add    $0x8,%rsp
  4011f3:	c3                   	retq   

00000000004011f4 <secret_phase>:
  4011f4:	53                   	push   %rbx
  4011f5:	e8 c2 03 00 00       	callq  4015bc <read_line>
  4011fa:	ba 0a 00 00 00       	mov    $0xa,%edx
  4011ff:	be 00 00 00 00       	mov    $0x0,%esi
  401204:	48 89 c7             	mov    %rax,%rdi
  401207:	e8 d4 f9 ff ff       	callq  400be0 <strtol@plt>
  40120c:	48 89 c3             	mov    %rax,%rbx
  40120f:	8d 40 ff             	lea    -0x1(%rax),%eax
  401212:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  401217:	76 05                	jbe    40121e <secret_phase+0x2a>
  401219:	e8 26 03 00 00       	callq  401544 <explode_bomb>
  40121e:	89 de                	mov    %ebx,%esi
  401220:	bf 10 41 60 00       	mov    $0x604110,%edi
  401225:	e8 8c ff ff ff       	callq  4011b6 <fun7>
  40122a:	85 c0                	test   %eax,%eax
  40122c:	74 05                	je     401233 <secret_phase+0x3f>
  40122e:	e8 11 03 00 00       	callq  401544 <explode_bomb>
  401233:	bf d8 24 40 00       	mov    $0x4024d8,%edi
  401238:	e8 f3 f8 ff ff       	callq  400b30 <puts@plt>
  40123d:	e8 a0 04 00 00       	callq  4016e2 <phase_defused>
  401242:	5b                   	pop    %rbx
  401243:	c3                   	retq   
  401244:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40124b:	00 00 00 
  40124e:	66 90                	xchg   %ax,%ax

0000000000401250 <sig_handler>:
  401250:	48 83 ec 08          	sub    $0x8,%rsp
  401254:	bf 80 25 40 00       	mov    $0x402580,%edi
  401259:	e8 d2 f8 ff ff       	callq  400b30 <puts@plt>
  40125e:	bf 03 00 00 00       	mov    $0x3,%edi
  401263:	e8 18 fa ff ff       	callq  400c80 <sleep@plt>
  401268:	bf 49 27 40 00       	mov    $0x402749,%edi
  40126d:	b8 00 00 00 00       	mov    $0x0,%eax
  401272:	e8 d9 f8 ff ff       	callq  400b50 <printf@plt>
  401277:	48 8b 3d 02 35 20 00 	mov    0x203502(%rip),%rdi        # 604780 <stdout@@GLIBC_2.2.5>
  40127e:	e8 7d f9 ff ff       	callq  400c00 <fflush@plt>
  401283:	bf 01 00 00 00       	mov    $0x1,%edi
  401288:	e8 f3 f9 ff ff       	callq  400c80 <sleep@plt>
  40128d:	bf 51 27 40 00       	mov    $0x402751,%edi
  401292:	e8 99 f8 ff ff       	callq  400b30 <puts@plt>
  401297:	bf 10 00 00 00       	mov    $0x10,%edi
  40129c:	e8 bf f9 ff ff       	callq  400c60 <exit@plt>

00000000004012a1 <invalid_phase>:
  4012a1:	48 83 ec 08          	sub    $0x8,%rsp
  4012a5:	48 89 fe             	mov    %rdi,%rsi
  4012a8:	bf 59 27 40 00       	mov    $0x402759,%edi
  4012ad:	b8 00 00 00 00       	mov    $0x0,%eax
  4012b2:	e8 99 f8 ff ff       	callq  400b50 <printf@plt>
  4012b7:	bf 08 00 00 00       	mov    $0x8,%edi
  4012bc:	e8 9f f9 ff ff       	callq  400c60 <exit@plt>

00000000004012c1 <string_length>:
  4012c1:	80 3f 00             	cmpb   $0x0,(%rdi)
  4012c4:	74 12                	je     4012d8 <string_length+0x17>
  4012c6:	48 89 fa             	mov    %rdi,%rdx
  4012c9:	48 83 c2 01          	add    $0x1,%rdx
  4012cd:	89 d0                	mov    %edx,%eax
  4012cf:	29 f8                	sub    %edi,%eax
  4012d1:	80 3a 00             	cmpb   $0x0,(%rdx)
  4012d4:	75 f3                	jne    4012c9 <string_length+0x8>
  4012d6:	f3 c3                	repz retq 
  4012d8:	b8 00 00 00 00       	mov    $0x0,%eax
  4012dd:	c3                   	retq   

00000000004012de <strings_not_equal>:
  4012de:	41 54                	push   %r12
  4012e0:	55                   	push   %rbp
  4012e1:	53                   	push   %rbx
  4012e2:	48 89 fb             	mov    %rdi,%rbx
  4012e5:	48 89 f5             	mov    %rsi,%rbp
  4012e8:	e8 d4 ff ff ff       	callq  4012c1 <string_length>
  4012ed:	41 89 c4             	mov    %eax,%r12d
  4012f0:	48 89 ef             	mov    %rbp,%rdi
  4012f3:	e8 c9 ff ff ff       	callq  4012c1 <string_length>
  4012f8:	ba 01 00 00 00       	mov    $0x1,%edx
  4012fd:	41 39 c4             	cmp    %eax,%r12d
  401300:	75 3e                	jne    401340 <strings_not_equal+0x62>
  401302:	0f b6 03             	movzbl (%rbx),%eax
  401305:	84 c0                	test   %al,%al
  401307:	74 24                	je     40132d <strings_not_equal+0x4f>
  401309:	3a 45 00             	cmp    0x0(%rbp),%al
  40130c:	74 09                	je     401317 <strings_not_equal+0x39>
  40130e:	66 90                	xchg   %ax,%ax
  401310:	eb 22                	jmp    401334 <strings_not_equal+0x56>
  401312:	3a 45 00             	cmp    0x0(%rbp),%al
  401315:	75 24                	jne    40133b <strings_not_equal+0x5d>
  401317:	48 83 c3 01          	add    $0x1,%rbx
  40131b:	48 83 c5 01          	add    $0x1,%rbp
  40131f:	0f b6 03             	movzbl (%rbx),%eax
  401322:	84 c0                	test   %al,%al
  401324:	75 ec                	jne    401312 <strings_not_equal+0x34>
  401326:	ba 00 00 00 00       	mov    $0x0,%edx
  40132b:	eb 13                	jmp    401340 <strings_not_equal+0x62>
  40132d:	ba 00 00 00 00       	mov    $0x0,%edx
  401332:	eb 0c                	jmp    401340 <strings_not_equal+0x62>
  401334:	ba 01 00 00 00       	mov    $0x1,%edx
  401339:	eb 05                	jmp    401340 <strings_not_equal+0x62>
  40133b:	ba 01 00 00 00       	mov    $0x1,%edx
  401340:	89 d0                	mov    %edx,%eax
  401342:	5b                   	pop    %rbx
  401343:	5d                   	pop    %rbp
  401344:	41 5c                	pop    %r12
  401346:	c3                   	retq   

0000000000401347 <initialize_bomb>:
  401347:	53                   	push   %rbx
  401348:	48 81 ec 40 20 00 00 	sub    $0x2040,%rsp
  40134f:	be 50 12 40 00       	mov    $0x401250,%esi
  401354:	bf 02 00 00 00       	mov    $0x2,%edi
  401359:	e8 52 f8 ff ff       	callq  400bb0 <signal@plt>
  40135e:	be 40 00 00 00       	mov    $0x40,%esi
  401363:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  40136a:	00 
  40136b:	e8 d0 f8 ff ff       	callq  400c40 <gethostname@plt>
  401370:	85 c0                	test   %eax,%eax
  401372:	75 13                	jne    401387 <initialize_bomb+0x40>
  401374:	48 8b 3d 05 30 20 00 	mov    0x203005(%rip),%rdi        # 604380 <host_table>
  40137b:	bb 88 43 60 00       	mov    $0x604388,%ebx
  401380:	48 85 ff             	test   %rdi,%rdi
  401383:	75 16                	jne    40139b <initialize_bomb+0x54>
  401385:	eb 50                	jmp    4013d7 <initialize_bomb+0x90>
  401387:	bf b8 25 40 00       	mov    $0x4025b8,%edi
  40138c:	e8 9f f7 ff ff       	callq  400b30 <puts@plt>
  401391:	bf 08 00 00 00       	mov    $0x8,%edi
  401396:	e8 c5 f8 ff ff       	callq  400c60 <exit@plt>
  40139b:	48 8d b4 24 00 20 00 	lea    0x2000(%rsp),%rsi
  4013a2:	00 
  4013a3:	e8 58 f7 ff ff       	callq  400b00 <strcasecmp@plt>
  4013a8:	85 c0                	test   %eax,%eax
  4013aa:	74 3f                	je     4013eb <initialize_bomb+0xa4>
  4013ac:	48 83 c3 08          	add    $0x8,%rbx
  4013b0:	48 8b 7b f8          	mov    -0x8(%rbx),%rdi
  4013b4:	48 85 ff             	test   %rdi,%rdi
  4013b7:	75 e2                	jne    40139b <initialize_bomb+0x54>
  4013b9:	eb 1c                	jmp    4013d7 <initialize_bomb+0x90>
  4013bb:	48 89 e6             	mov    %rsp,%rsi
  4013be:	bf 6a 27 40 00       	mov    $0x40276a,%edi
  4013c3:	b8 00 00 00 00       	mov    $0x0,%eax
  4013c8:	e8 83 f7 ff ff       	callq  400b50 <printf@plt>
  4013cd:	bf 08 00 00 00       	mov    $0x8,%edi
  4013d2:	e8 89 f8 ff ff       	callq  400c60 <exit@plt>
  4013d7:	bf f0 25 40 00       	mov    $0x4025f0,%edi
  4013dc:	e8 4f f7 ff ff       	callq  400b30 <puts@plt>
  4013e1:	bf 08 00 00 00       	mov    $0x8,%edi
  4013e6:	e8 75 f8 ff ff       	callq  400c60 <exit@plt>
  4013eb:	48 89 e7             	mov    %rsp,%rdi
  4013ee:	e8 9e 0c 00 00       	callq  402091 <init_driver>
  4013f3:	85 c0                	test   %eax,%eax
  4013f5:	78 c4                	js     4013bb <initialize_bomb+0x74>
  4013f7:	48 81 c4 40 20 00 00 	add    $0x2040,%rsp
  4013fe:	5b                   	pop    %rbx
  4013ff:	c3                   	retq   

0000000000401400 <initialize_bomb_solve>:
  401400:	f3 c3                	repz retq 

0000000000401402 <blank_line>:
  401402:	55                   	push   %rbp
  401403:	53                   	push   %rbx
  401404:	48 83 ec 08          	sub    $0x8,%rsp
  401408:	48 89 fb             	mov    %rdi,%rbx
  40140b:	eb 17                	jmp    401424 <blank_line+0x22>
  40140d:	e8 7e f8 ff ff       	callq  400c90 <__ctype_b_loc@plt>
  401412:	48 83 c3 01          	add    $0x1,%rbx
  401416:	48 0f be ed          	movsbq %bpl,%rbp
  40141a:	48 8b 00             	mov    (%rax),%rax
  40141d:	f6 44 68 01 20       	testb  $0x20,0x1(%rax,%rbp,2)
  401422:	74 0f                	je     401433 <blank_line+0x31>
  401424:	0f b6 2b             	movzbl (%rbx),%ebp
  401427:	40 84 ed             	test   %bpl,%bpl
  40142a:	75 e1                	jne    40140d <blank_line+0xb>
  40142c:	b8 01 00 00 00       	mov    $0x1,%eax
  401431:	eb 05                	jmp    401438 <blank_line+0x36>
  401433:	b8 00 00 00 00       	mov    $0x0,%eax
  401438:	48 83 c4 08          	add    $0x8,%rsp
  40143c:	5b                   	pop    %rbx
  40143d:	5d                   	pop    %rbp
  40143e:	c3                   	retq   

000000000040143f <skip>:
  40143f:	53                   	push   %rbx
  401440:	48 63 05 55 33 20 00 	movslq 0x203355(%rip),%rax        # 60479c <num_input_strings>
  401447:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
  40144b:	48 c1 e7 04          	shl    $0x4,%rdi
  40144f:	48 81 c7 c0 47 60 00 	add    $0x6047c0,%rdi
  401456:	48 8b 15 43 33 20 00 	mov    0x203343(%rip),%rdx        # 6047a0 <infile>
  40145d:	be 50 00 00 00       	mov    $0x50,%esi
  401462:	e8 39 f7 ff ff       	callq  400ba0 <fgets@plt>
  401467:	48 89 c3             	mov    %rax,%rbx
  40146a:	48 85 c0             	test   %rax,%rax
  40146d:	74 0c                	je     40147b <skip+0x3c>
  40146f:	48 89 c7             	mov    %rax,%rdi
  401472:	e8 8b ff ff ff       	callq  401402 <blank_line>
  401477:	85 c0                	test   %eax,%eax
  401479:	75 c5                	jne    401440 <skip+0x1>
  40147b:	48 89 d8             	mov    %rbx,%rax
  40147e:	5b                   	pop    %rbx
  40147f:	c3                   	retq   

0000000000401480 <send_msg>:
  401480:	48 81 ec 08 40 00 00 	sub    $0x4008,%rsp
  401487:	89 fe                	mov    %edi,%esi
  401489:	44 8b 05 0c 33 20 00 	mov    0x20330c(%rip),%r8d        # 60479c <num_input_strings>
  401490:	41 8d 40 ff          	lea    -0x1(%r8),%eax
  401494:	48 98                	cltq   
  401496:	4c 8d 0c 80          	lea    (%rax,%rax,4),%r9
  40149a:	49 c1 e1 04          	shl    $0x4,%r9
  40149e:	49 81 c1 c0 47 60 00 	add    $0x6047c0,%r9
  4014a5:	4c 89 cf             	mov    %r9,%rdi
  4014a8:	b8 00 00 00 00       	mov    $0x0,%eax
  4014ad:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4014b4:	f2 ae                	repnz scas %es:(%rdi),%al
  4014b6:	48 f7 d1             	not    %rcx
  4014b9:	48 83 c1 63          	add    $0x63,%rcx
  4014bd:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  4014c4:	76 14                	jbe    4014da <send_msg+0x5a>
  4014c6:	bf 28 26 40 00       	mov    $0x402628,%edi
  4014cb:	e8 80 f6 ff ff       	callq  400b50 <printf@plt>
  4014d0:	bf 08 00 00 00       	mov    $0x8,%edi
  4014d5:	e8 86 f7 ff ff       	callq  400c60 <exit@plt>
  4014da:	85 f6                	test   %esi,%esi
  4014dc:	b8 84 27 40 00       	mov    $0x402784,%eax
  4014e1:	b9 8c 27 40 00       	mov    $0x40278c,%ecx
  4014e6:	48 0f 45 c8          	cmovne %rax,%rcx
  4014ea:	8b 15 80 2e 20 00    	mov    0x202e80(%rip),%edx        # 604370 <bomb_id>
  4014f0:	be 95 27 40 00       	mov    $0x402795,%esi
  4014f5:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  4014fc:	00 
  4014fd:	b8 00 00 00 00       	mov    $0x0,%eax
  401502:	e8 49 f7 ff ff       	callq  400c50 <sprintf@plt>
  401507:	49 89 e0             	mov    %rsp,%r8
  40150a:	b9 00 00 00 00       	mov    $0x0,%ecx
  40150f:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
  401516:	00 
  401517:	be 50 43 60 00       	mov    $0x604350,%esi
  40151c:	bf 65 43 60 00       	mov    $0x604365,%edi
  401521:	e8 09 0d 00 00       	callq  40222f <driver_post>
  401526:	85 c0                	test   %eax,%eax
  401528:	79 12                	jns    40153c <send_msg+0xbc>
  40152a:	48 89 e7             	mov    %rsp,%rdi
  40152d:	e8 fe f5 ff ff       	callq  400b30 <puts@plt>
  401532:	bf 00 00 00 00       	mov    $0x0,%edi
  401537:	e8 24 f7 ff ff       	callq  400c60 <exit@plt>
  40153c:	48 81 c4 08 40 00 00 	add    $0x4008,%rsp
  401543:	c3                   	retq   

0000000000401544 <explode_bomb>:
  401544:	48 83 ec 08          	sub    $0x8,%rsp
  401548:	bf a1 27 40 00       	mov    $0x4027a1,%edi
  40154d:	e8 de f5 ff ff       	callq  400b30 <puts@plt>
  401552:	bf aa 27 40 00       	mov    $0x4027aa,%edi
  401557:	e8 d4 f5 ff ff       	callq  400b30 <puts@plt>
  40155c:	bf 00 00 00 00       	mov    $0x0,%edi
  401561:	e8 1a ff ff ff       	callq  401480 <send_msg>
  401566:	bf 50 26 40 00       	mov    $0x402650,%edi
  40156b:	e8 c0 f5 ff ff       	callq  400b30 <puts@plt>
  401570:	bf 08 00 00 00       	mov    $0x8,%edi
  401575:	e8 e6 f6 ff ff       	callq  400c60 <exit@plt>

000000000040157a <read_six_numbers>:
  40157a:	48 83 ec 18          	sub    $0x18,%rsp
  40157e:	48 89 f2             	mov    %rsi,%rdx
  401581:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  401585:	48 8d 46 14          	lea    0x14(%rsi),%rax
  401589:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  40158e:	48 8d 46 10          	lea    0x10(%rsi),%rax
  401592:	48 89 04 24          	mov    %rax,(%rsp)
  401596:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  40159a:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  40159e:	be c1 27 40 00       	mov    $0x4027c1,%esi
  4015a3:	b8 00 00 00 00       	mov    $0x0,%eax
  4015a8:	e8 63 f6 ff ff       	callq  400c10 <__isoc99_sscanf@plt>
  4015ad:	83 f8 05             	cmp    $0x5,%eax
  4015b0:	7f 05                	jg     4015b7 <read_six_numbers+0x3d>
  4015b2:	e8 8d ff ff ff       	callq  401544 <explode_bomb>
  4015b7:	48 83 c4 18          	add    $0x18,%rsp
  4015bb:	c3                   	retq   

00000000004015bc <read_line>:
  4015bc:	48 83 ec 08          	sub    $0x8,%rsp
  4015c0:	b8 00 00 00 00       	mov    $0x0,%eax
  4015c5:	e8 75 fe ff ff       	callq  40143f <skip>
  4015ca:	48 85 c0             	test   %rax,%rax
  4015cd:	75 6e                	jne    40163d <read_line+0x81>
  4015cf:	48 8b 05 b2 31 20 00 	mov    0x2031b2(%rip),%rax        # 604788 <stdin@@GLIBC_2.2.5>
  4015d6:	48 39 05 c3 31 20 00 	cmp    %rax,0x2031c3(%rip)        # 6047a0 <infile>
  4015dd:	75 14                	jne    4015f3 <read_line+0x37>
  4015df:	bf d3 27 40 00       	mov    $0x4027d3,%edi
  4015e4:	e8 47 f5 ff ff       	callq  400b30 <puts@plt>
  4015e9:	bf 08 00 00 00       	mov    $0x8,%edi
  4015ee:	e8 6d f6 ff ff       	callq  400c60 <exit@plt>
  4015f3:	bf f1 27 40 00       	mov    $0x4027f1,%edi
  4015f8:	e8 f3 f4 ff ff       	callq  400af0 <getenv@plt>
  4015fd:	48 85 c0             	test   %rax,%rax
  401600:	74 0a                	je     40160c <read_line+0x50>
  401602:	bf 00 00 00 00       	mov    $0x0,%edi
  401607:	e8 54 f6 ff ff       	callq  400c60 <exit@plt>
  40160c:	48 8b 05 75 31 20 00 	mov    0x203175(%rip),%rax        # 604788 <stdin@@GLIBC_2.2.5>
  401613:	48 89 05 86 31 20 00 	mov    %rax,0x203186(%rip)        # 6047a0 <infile>
  40161a:	b8 00 00 00 00       	mov    $0x0,%eax
  40161f:	e8 1b fe ff ff       	callq  40143f <skip>
  401624:	48 85 c0             	test   %rax,%rax
  401627:	75 14                	jne    40163d <read_line+0x81>
  401629:	bf d3 27 40 00       	mov    $0x4027d3,%edi
  40162e:	e8 fd f4 ff ff       	callq  400b30 <puts@plt>
  401633:	bf 00 00 00 00       	mov    $0x0,%edi
  401638:	e8 23 f6 ff ff       	callq  400c60 <exit@plt>
  40163d:	8b 15 59 31 20 00    	mov    0x203159(%rip),%edx        # 60479c <num_input_strings>
  401643:	48 63 c2             	movslq %edx,%rax
  401646:	48 8d 34 80          	lea    (%rax,%rax,4),%rsi
  40164a:	48 c1 e6 04          	shl    $0x4,%rsi
  40164e:	48 81 c6 c0 47 60 00 	add    $0x6047c0,%rsi
  401655:	48 89 f7             	mov    %rsi,%rdi
  401658:	b8 00 00 00 00       	mov    $0x0,%eax
  40165d:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401664:	f2 ae                	repnz scas %es:(%rdi),%al
  401666:	48 f7 d1             	not    %rcx
  401669:	48 83 e9 01          	sub    $0x1,%rcx
  40166d:	83 f9 4e             	cmp    $0x4e,%ecx
  401670:	7e 46                	jle    4016b8 <read_line+0xfc>
  401672:	bf fc 27 40 00       	mov    $0x4027fc,%edi
  401677:	e8 b4 f4 ff ff       	callq  400b30 <puts@plt>
  40167c:	8b 05 1a 31 20 00    	mov    0x20311a(%rip),%eax        # 60479c <num_input_strings>
  401682:	8d 50 01             	lea    0x1(%rax),%edx
  401685:	89 15 11 31 20 00    	mov    %edx,0x203111(%rip)        # 60479c <num_input_strings>
  40168b:	48 98                	cltq   
  40168d:	48 6b c0 50          	imul   $0x50,%rax,%rax
  401691:	48 bf 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rdi
  401698:	75 6e 63 
  40169b:	48 89 b8 c0 47 60 00 	mov    %rdi,0x6047c0(%rax)
  4016a2:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
  4016a9:	2a 2a 00 
  4016ac:	48 89 b8 c8 47 60 00 	mov    %rdi,0x6047c8(%rax)
  4016b3:	e8 8c fe ff ff       	callq  401544 <explode_bomb>
  4016b8:	83 e9 01             	sub    $0x1,%ecx
  4016bb:	48 63 c9             	movslq %ecx,%rcx
  4016be:	48 63 c2             	movslq %edx,%rax
  4016c1:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4016c5:	48 c1 e0 04          	shl    $0x4,%rax
  4016c9:	c6 84 01 c0 47 60 00 	movb   $0x0,0x6047c0(%rcx,%rax,1)
  4016d0:	00 
  4016d1:	83 c2 01             	add    $0x1,%edx
  4016d4:	89 15 c2 30 20 00    	mov    %edx,0x2030c2(%rip)        # 60479c <num_input_strings>
  4016da:	48 89 f0             	mov    %rsi,%rax
  4016dd:	48 83 c4 08          	add    $0x8,%rsp
  4016e1:	c3                   	retq   

00000000004016e2 <phase_defused>:
  4016e2:	48 83 ec 68          	sub    $0x68,%rsp
  4016e6:	bf 01 00 00 00       	mov    $0x1,%edi
  4016eb:	e8 90 fd ff ff       	callq  401480 <send_msg>
  4016f0:	83 3d a5 30 20 00 06 	cmpl   $0x6,0x2030a5(%rip)        # 60479c <num_input_strings>
  4016f7:	75 6d                	jne    401766 <phase_defused+0x84>
  4016f9:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  4016fe:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  401703:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  401708:	be 17 28 40 00       	mov    $0x402817,%esi
  40170d:	bf b0 48 60 00       	mov    $0x6048b0,%edi
  401712:	b8 00 00 00 00       	mov    $0x0,%eax
  401717:	e8 f4 f4 ff ff       	callq  400c10 <__isoc99_sscanf@plt>
  40171c:	83 f8 03             	cmp    $0x3,%eax
  40171f:	75 31                	jne    401752 <phase_defused+0x70>
  401721:	be 20 28 40 00       	mov    $0x402820,%esi
  401726:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  40172b:	e8 ae fb ff ff       	callq  4012de <strings_not_equal>
  401730:	85 c0                	test   %eax,%eax
  401732:	75 1e                	jne    401752 <phase_defused+0x70>
  401734:	bf 78 26 40 00       	mov    $0x402678,%edi
  401739:	e8 f2 f3 ff ff       	callq  400b30 <puts@plt>
  40173e:	bf a0 26 40 00       	mov    $0x4026a0,%edi
  401743:	e8 e8 f3 ff ff       	callq  400b30 <puts@plt>
  401748:	b8 00 00 00 00       	mov    $0x0,%eax
  40174d:	e8 a2 fa ff ff       	callq  4011f4 <secret_phase>
  401752:	bf d8 26 40 00       	mov    $0x4026d8,%edi
  401757:	e8 d4 f3 ff ff       	callq  400b30 <puts@plt>
  40175c:	bf 08 27 40 00       	mov    $0x402708,%edi
  401761:	e8 ca f3 ff ff       	callq  400b30 <puts@plt>
  401766:	48 83 c4 68          	add    $0x68,%rsp
  40176a:	c3                   	retq   
  40176b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401770 <sigalrm_handler>:
  401770:	48 83 ec 08          	sub    $0x8,%rsp
  401774:	ba 00 00 00 00       	mov    $0x0,%edx
  401779:	be 68 2b 40 00       	mov    $0x402b68,%esi
  40177e:	48 8b 3d 0b 30 20 00 	mov    0x20300b(%rip),%rdi        # 604790 <stderr@@GLIBC_2.2.5>
  401785:	b8 00 00 00 00       	mov    $0x0,%eax
  40178a:	e8 41 f4 ff ff       	callq  400bd0 <fprintf@plt>
  40178f:	bf 01 00 00 00       	mov    $0x1,%edi
  401794:	e8 c7 f4 ff ff       	callq  400c60 <exit@plt>

0000000000401799 <rio_readlineb>:
  401799:	41 57                	push   %r15
  40179b:	41 56                	push   %r14
  40179d:	41 55                	push   %r13
  40179f:	41 54                	push   %r12
  4017a1:	55                   	push   %rbp
  4017a2:	53                   	push   %rbx
  4017a3:	48 83 ec 38          	sub    $0x38,%rsp
  4017a7:	49 89 f6             	mov    %rsi,%r14
  4017aa:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
  4017af:	48 83 fa 01          	cmp    $0x1,%rdx
  4017b3:	0f 86 c2 00 00 00    	jbe    40187b <rio_readlineb+0xe2>
  4017b9:	48 89 fb             	mov    %rdi,%rbx
  4017bc:	41 bd 01 00 00 00    	mov    $0x1,%r13d
  4017c2:	4c 8d 67 10          	lea    0x10(%rdi),%r12
  4017c6:	eb 2e                	jmp    4017f6 <rio_readlineb+0x5d>
  4017c8:	ba 00 20 00 00       	mov    $0x2000,%edx
  4017cd:	4c 89 e6             	mov    %r12,%rsi
  4017d0:	8b 3b                	mov    (%rbx),%edi
  4017d2:	e8 a9 f3 ff ff       	callq  400b80 <read@plt>
  4017d7:	89 43 04             	mov    %eax,0x4(%rbx)
  4017da:	85 c0                	test   %eax,%eax
  4017dc:	79 0f                	jns    4017ed <rio_readlineb+0x54>
  4017de:	e8 2d f3 ff ff       	callq  400b10 <__errno_location@plt>
  4017e3:	83 38 04             	cmpl   $0x4,(%rax)
  4017e6:	74 0e                	je     4017f6 <rio_readlineb+0x5d>
  4017e8:	e9 9d 00 00 00       	jmpq   40188a <rio_readlineb+0xf1>
  4017ed:	85 c0                	test   %eax,%eax
  4017ef:	90                   	nop
  4017f0:	74 6c                	je     40185e <rio_readlineb+0xc5>
  4017f2:	4c 89 63 08          	mov    %r12,0x8(%rbx)
  4017f6:	8b 6b 04             	mov    0x4(%rbx),%ebp
  4017f9:	85 ed                	test   %ebp,%ebp
  4017fb:	7e cb                	jle    4017c8 <rio_readlineb+0x2f>
  4017fd:	85 ed                	test   %ebp,%ebp
  4017ff:	41 0f 95 c7          	setne  %r15b
  401803:	41 0f b6 c7          	movzbl %r15b,%eax
  401807:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40180b:	45 0f b6 ff          	movzbl %r15b,%r15d
  40180f:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  401813:	4c 89 fa             	mov    %r15,%rdx
  401816:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
  40181b:	48 89 ce             	mov    %rcx,%rsi
  40181e:	48 8d 7c 24 2f       	lea    0x2f(%rsp),%rdi
  401823:	e8 c8 f3 ff ff       	callq  400bf0 <memcpy@plt>
  401828:	4c 03 7c 24 10       	add    0x10(%rsp),%r15
  40182d:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
  401831:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401835:	29 c5                	sub    %eax,%ebp
  401837:	89 6b 04             	mov    %ebp,0x4(%rbx)
  40183a:	83 f8 01             	cmp    $0x1,%eax
  40183d:	75 13                	jne    401852 <rio_readlineb+0xb9>
  40183f:	49 83 c6 01          	add    $0x1,%r14
  401843:	0f b6 44 24 2f       	movzbl 0x2f(%rsp),%eax
  401848:	41 88 46 ff          	mov    %al,-0x1(%r14)
  40184c:	3c 0a                	cmp    $0xa,%al
  40184e:	75 18                	jne    401868 <rio_readlineb+0xcf>
  401850:	eb 2f                	jmp    401881 <rio_readlineb+0xe8>
  401852:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%rsp)
  401857:	75 3a                	jne    401893 <rio_readlineb+0xfa>
  401859:	44 89 e8             	mov    %r13d,%eax
  40185c:	eb 03                	jmp    401861 <rio_readlineb+0xc8>
  40185e:	44 89 e8             	mov    %r13d,%eax
  401861:	83 f8 01             	cmp    $0x1,%eax
  401864:	75 1b                	jne    401881 <rio_readlineb+0xe8>
  401866:	eb 34                	jmp    40189c <rio_readlineb+0x103>
  401868:	41 83 c5 01          	add    $0x1,%r13d
  40186c:	49 63 c5             	movslq %r13d,%rax
  40186f:	48 3b 44 24 18       	cmp    0x18(%rsp),%rax
  401874:	73 0b                	jae    401881 <rio_readlineb+0xe8>
  401876:	e9 7b ff ff ff       	jmpq   4017f6 <rio_readlineb+0x5d>
  40187b:	41 bd 01 00 00 00    	mov    $0x1,%r13d
  401881:	41 c6 06 00          	movb   $0x0,(%r14)
  401885:	49 63 c5             	movslq %r13d,%rax
  401888:	eb 17                	jmp    4018a1 <rio_readlineb+0x108>
  40188a:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401891:	eb 0e                	jmp    4018a1 <rio_readlineb+0x108>
  401893:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40189a:	eb 05                	jmp    4018a1 <rio_readlineb+0x108>
  40189c:	b8 00 00 00 00       	mov    $0x0,%eax
  4018a1:	48 83 c4 38          	add    $0x38,%rsp
  4018a5:	5b                   	pop    %rbx
  4018a6:	5d                   	pop    %rbp
  4018a7:	41 5c                	pop    %r12
  4018a9:	41 5d                	pop    %r13
  4018ab:	41 5e                	pop    %r14
  4018ad:	41 5f                	pop    %r15
  4018af:	c3                   	retq   

00000000004018b0 <submitr>:
  4018b0:	41 57                	push   %r15
  4018b2:	41 56                	push   %r14
  4018b4:	41 55                	push   %r13
  4018b6:	41 54                	push   %r12
  4018b8:	55                   	push   %rbp
  4018b9:	53                   	push   %rbx
  4018ba:	48 81 ec 68 a0 00 00 	sub    $0xa068,%rsp
  4018c1:	48 89 fd             	mov    %rdi,%rbp
  4018c4:	41 89 f5             	mov    %esi,%r13d
  4018c7:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
  4018cc:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
  4018d1:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  4018d6:	4d 89 cf             	mov    %r9,%r15
  4018d9:	48 8b 9c 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbx
  4018e0:	00 
  4018e1:	4c 8b b4 24 a8 a0 00 	mov    0xa0a8(%rsp),%r14
  4018e8:	00 
  4018e9:	c7 84 24 3c 20 00 00 	movl   $0x0,0x203c(%rsp)
  4018f0:	00 00 00 00 
  4018f4:	ba 00 00 00 00       	mov    $0x0,%edx
  4018f9:	be 01 00 00 00       	mov    $0x1,%esi
  4018fe:	bf 02 00 00 00       	mov    $0x2,%edi
  401903:	e8 98 f3 ff ff       	callq  400ca0 <socket@plt>
  401908:	41 89 c4             	mov    %eax,%r12d
  40190b:	85 c0                	test   %eax,%eax
  40190d:	79 50                	jns    40195f <submitr+0xaf>
  40190f:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401916:	3a 20 43 
  401919:	49 89 06             	mov    %rax,(%r14)
  40191c:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401923:	20 75 6e 
  401926:	49 89 46 08          	mov    %rax,0x8(%r14)
  40192a:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401931:	74 6f 20 
  401934:	49 89 46 10          	mov    %rax,0x10(%r14)
  401938:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  40193f:	65 20 73 
  401942:	49 89 46 18          	mov    %rax,0x18(%r14)
  401946:	41 c7 46 20 6f 63 6b 	movl   $0x656b636f,0x20(%r14)
  40194d:	65 
  40194e:	66 41 c7 46 24 74 00 	movw   $0x74,0x24(%r14)
  401955:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40195a:	e9 f9 06 00 00       	jmpq   402058 <submitr+0x7a8>
  40195f:	48 89 ef             	mov    %rbp,%rdi
  401962:	e8 59 f2 ff ff       	callq  400bc0 <gethostbyname@plt>
  401967:	48 85 c0             	test   %rax,%rax
  40196a:	75 6b                	jne    4019d7 <submitr+0x127>
  40196c:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  401973:	3a 20 44 
  401976:	49 89 06             	mov    %rax,(%r14)
  401979:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  401980:	20 75 6e 
  401983:	49 89 46 08          	mov    %rax,0x8(%r14)
  401987:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40198e:	74 6f 20 
  401991:	49 89 46 10          	mov    %rax,0x10(%r14)
  401995:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  40199c:	76 65 20 
  40199f:	49 89 46 18          	mov    %rax,0x18(%r14)
  4019a3:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4019aa:	72 20 61 
  4019ad:	49 89 46 20          	mov    %rax,0x20(%r14)
  4019b1:	41 c7 46 28 64 64 72 	movl   $0x65726464,0x28(%r14)
  4019b8:	65 
  4019b9:	66 41 c7 46 2c 73 73 	movw   $0x7373,0x2c(%r14)
  4019c0:	41 c6 46 2e 00       	movb   $0x0,0x2e(%r14)
  4019c5:	44 89 e7             	mov    %r12d,%edi
  4019c8:	e8 a3 f1 ff ff       	callq  400b70 <close@plt>
  4019cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4019d2:	e9 81 06 00 00       	jmpq   402058 <submitr+0x7a8>
  4019d7:	48 c7 84 24 50 a0 00 	movq   $0x0,0xa050(%rsp)
  4019de:	00 00 00 00 00 
  4019e3:	48 c7 84 24 58 a0 00 	movq   $0x0,0xa058(%rsp)
  4019ea:	00 00 00 00 00 
  4019ef:	66 c7 84 24 50 a0 00 	movw   $0x2,0xa050(%rsp)
  4019f6:	00 02 00 
  4019f9:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4019fd:	48 8d b4 24 54 a0 00 	lea    0xa054(%rsp),%rsi
  401a04:	00 
  401a05:	48 8b 40 18          	mov    0x18(%rax),%rax
  401a09:	48 8b 38             	mov    (%rax),%rdi
  401a0c:	e8 0f f2 ff ff       	callq  400c20 <bcopy@plt>
  401a11:	66 41 c1 cd 08       	ror    $0x8,%r13w
  401a16:	66 44 89 ac 24 52 a0 	mov    %r13w,0xa052(%rsp)
  401a1d:	00 00 
  401a1f:	ba 10 00 00 00       	mov    $0x10,%edx
  401a24:	48 8d b4 24 50 a0 00 	lea    0xa050(%rsp),%rsi
  401a2b:	00 
  401a2c:	44 89 e7             	mov    %r12d,%edi
  401a2f:	e8 3c f2 ff ff       	callq  400c70 <connect@plt>
  401a34:	85 c0                	test   %eax,%eax
  401a36:	79 5d                	jns    401a95 <submitr+0x1e5>
  401a38:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  401a3f:	3a 20 55 
  401a42:	49 89 06             	mov    %rax,(%r14)
  401a45:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  401a4c:	20 74 6f 
  401a4f:	49 89 46 08          	mov    %rax,0x8(%r14)
  401a53:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  401a5a:	65 63 74 
  401a5d:	49 89 46 10          	mov    %rax,0x10(%r14)
  401a61:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  401a68:	68 65 20 
  401a6b:	49 89 46 18          	mov    %rax,0x18(%r14)
  401a6f:	41 c7 46 20 73 65 72 	movl   $0x76726573,0x20(%r14)
  401a76:	76 
  401a77:	66 41 c7 46 24 65 72 	movw   $0x7265,0x24(%r14)
  401a7e:	41 c6 46 26 00       	movb   $0x0,0x26(%r14)
  401a83:	44 89 e7             	mov    %r12d,%edi
  401a86:	e8 e5 f0 ff ff       	callq  400b70 <close@plt>
  401a8b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401a90:	e9 c3 05 00 00       	jmpq   402058 <submitr+0x7a8>
  401a95:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401a9c:	48 89 df             	mov    %rbx,%rdi
  401a9f:	b8 00 00 00 00       	mov    $0x0,%eax
  401aa4:	48 89 d1             	mov    %rdx,%rcx
  401aa7:	f2 ae                	repnz scas %es:(%rdi),%al
  401aa9:	48 f7 d1             	not    %rcx
  401aac:	48 89 ce             	mov    %rcx,%rsi
  401aaf:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  401ab4:	48 89 d1             	mov    %rdx,%rcx
  401ab7:	f2 ae                	repnz scas %es:(%rdi),%al
  401ab9:	49 89 c8             	mov    %rcx,%r8
  401abc:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  401ac1:	48 89 d1             	mov    %rdx,%rcx
  401ac4:	f2 ae                	repnz scas %es:(%rdi),%al
  401ac6:	48 f7 d1             	not    %rcx
  401ac9:	49 89 c9             	mov    %rcx,%r9
  401acc:	4c 89 ff             	mov    %r15,%rdi
  401acf:	48 89 d1             	mov    %rdx,%rcx
  401ad2:	f2 ae                	repnz scas %es:(%rdi),%al
  401ad4:	4d 29 c1             	sub    %r8,%r9
  401ad7:	49 29 c9             	sub    %rcx,%r9
  401ada:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  401adf:	49 8d 44 01 7b       	lea    0x7b(%r9,%rax,1),%rax
  401ae4:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  401aea:	76 73                	jbe    401b5f <submitr+0x2af>
  401aec:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  401af3:	3a 20 52 
  401af6:	49 89 06             	mov    %rax,(%r14)
  401af9:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  401b00:	20 73 74 
  401b03:	49 89 46 08          	mov    %rax,0x8(%r14)
  401b07:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  401b0e:	74 6f 6f 
  401b11:	49 89 46 10          	mov    %rax,0x10(%r14)
  401b15:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  401b1c:	65 2e 20 
  401b1f:	49 89 46 18          	mov    %rax,0x18(%r14)
  401b23:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  401b2a:	61 73 65 
  401b2d:	49 89 46 20          	mov    %rax,0x20(%r14)
  401b31:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  401b38:	49 54 52 
  401b3b:	49 89 46 28          	mov    %rax,0x28(%r14)
  401b3f:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  401b46:	55 46 00 
  401b49:	49 89 46 30          	mov    %rax,0x30(%r14)
  401b4d:	44 89 e7             	mov    %r12d,%edi
  401b50:	e8 1b f0 ff ff       	callq  400b70 <close@plt>
  401b55:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401b5a:	e9 f9 04 00 00       	jmpq   402058 <submitr+0x7a8>
  401b5f:	48 8d 94 24 40 40 00 	lea    0x4040(%rsp),%rdx
  401b66:	00 
  401b67:	b9 00 04 00 00       	mov    $0x400,%ecx
  401b6c:	b8 00 00 00 00       	mov    $0x0,%eax
  401b71:	48 89 d7             	mov    %rdx,%rdi
  401b74:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  401b77:	48 89 df             	mov    %rbx,%rdi
  401b7a:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401b81:	f2 ae                	repnz scas %es:(%rdi),%al
  401b83:	48 f7 d1             	not    %rcx
  401b86:	48 83 e9 01          	sub    $0x1,%rcx
  401b8a:	85 c9                	test   %ecx,%ecx
  401b8c:	0f 84 d3 03 00 00    	je     401f65 <submitr+0x6b5>
  401b92:	8d 41 ff             	lea    -0x1(%rcx),%eax
  401b95:	4c 8d 6c 03 01       	lea    0x1(%rbx,%rax,1),%r13
  401b9a:	48 89 d5             	mov    %rdx,%rbp
  401b9d:	0f b6 13             	movzbl (%rbx),%edx
  401ba0:	80 fa 2a             	cmp    $0x2a,%dl
  401ba3:	74 1f                	je     401bc4 <submitr+0x314>
  401ba5:	8d 42 d3             	lea    -0x2d(%rdx),%eax
  401ba8:	3c 01                	cmp    $0x1,%al
  401baa:	76 18                	jbe    401bc4 <submitr+0x314>
  401bac:	80 fa 5f             	cmp    $0x5f,%dl
  401baf:	74 13                	je     401bc4 <submitr+0x314>
  401bb1:	8d 42 d0             	lea    -0x30(%rdx),%eax
  401bb4:	3c 09                	cmp    $0x9,%al
  401bb6:	76 0c                	jbe    401bc4 <submitr+0x314>
  401bb8:	89 d0                	mov    %edx,%eax
  401bba:	83 e0 df             	and    $0xffffffdf,%eax
  401bbd:	83 e8 41             	sub    $0x41,%eax
  401bc0:	3c 19                	cmp    $0x19,%al
  401bc2:	77 09                	ja     401bcd <submitr+0x31d>
  401bc4:	48 8d 45 01          	lea    0x1(%rbp),%rax
  401bc8:	88 55 00             	mov    %dl,0x0(%rbp)
  401bcb:	eb 52                	jmp    401c1f <submitr+0x36f>
  401bcd:	80 fa 20             	cmp    $0x20,%dl
  401bd0:	75 0a                	jne    401bdc <submitr+0x32c>
  401bd2:	48 8d 45 01          	lea    0x1(%rbp),%rax
  401bd6:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  401bda:	eb 43                	jmp    401c1f <submitr+0x36f>
  401bdc:	8d 42 e0             	lea    -0x20(%rdx),%eax
  401bdf:	3c 5f                	cmp    $0x5f,%al
  401be1:	76 09                	jbe    401bec <submitr+0x33c>
  401be3:	80 fa 09             	cmp    $0x9,%dl
  401be6:	0f 85 e4 03 00 00    	jne    401fd0 <submitr+0x720>
  401bec:	0f b6 d2             	movzbl %dl,%edx
  401bef:	be 40 2c 40 00       	mov    $0x402c40,%esi
  401bf4:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401bf9:	b8 00 00 00 00       	mov    $0x0,%eax
  401bfe:	e8 4d f0 ff ff       	callq  400c50 <sprintf@plt>
  401c03:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
  401c08:	88 45 00             	mov    %al,0x0(%rbp)
  401c0b:	0f b6 44 24 21       	movzbl 0x21(%rsp),%eax
  401c10:	88 45 01             	mov    %al,0x1(%rbp)
  401c13:	48 8d 45 03          	lea    0x3(%rbp),%rax
  401c17:	0f b6 54 24 22       	movzbl 0x22(%rsp),%edx
  401c1c:	88 55 02             	mov    %dl,0x2(%rbp)
  401c1f:	48 83 c3 01          	add    $0x1,%rbx
  401c23:	4c 39 eb             	cmp    %r13,%rbx
  401c26:	0f 84 39 03 00 00    	je     401f65 <submitr+0x6b5>
  401c2c:	48 89 c5             	mov    %rax,%rbp
  401c2f:	e9 69 ff ff ff       	jmpq   401b9d <submitr+0x2ed>
  401c34:	48 89 da             	mov    %rbx,%rdx
  401c37:	48 89 ee             	mov    %rbp,%rsi
  401c3a:	44 89 e7             	mov    %r12d,%edi
  401c3d:	e8 fe ee ff ff       	callq  400b40 <write@plt>
  401c42:	48 85 c0             	test   %rax,%rax
  401c45:	7f 10                	jg     401c57 <submitr+0x3a7>
  401c47:	e8 c4 ee ff ff       	callq  400b10 <__errno_location@plt>
  401c4c:	83 38 04             	cmpl   $0x4,(%rax)
  401c4f:	90                   	nop
  401c50:	75 12                	jne    401c64 <submitr+0x3b4>
  401c52:	b8 00 00 00 00       	mov    $0x0,%eax
  401c57:	48 01 c5             	add    %rax,%rbp
  401c5a:	48 29 c3             	sub    %rax,%rbx
  401c5d:	75 d5                	jne    401c34 <submitr+0x384>
  401c5f:	4d 85 ed             	test   %r13,%r13
  401c62:	79 5f                	jns    401cc3 <submitr+0x413>
  401c64:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401c6b:	3a 20 43 
  401c6e:	49 89 06             	mov    %rax,(%r14)
  401c71:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401c78:	20 75 6e 
  401c7b:	49 89 46 08          	mov    %rax,0x8(%r14)
  401c7f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401c86:	74 6f 20 
  401c89:	49 89 46 10          	mov    %rax,0x10(%r14)
  401c8d:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  401c94:	20 74 6f 
  401c97:	49 89 46 18          	mov    %rax,0x18(%r14)
  401c9b:	48 b8 20 74 68 65 20 	movabs $0x7265732065687420,%rax
  401ca2:	73 65 72 
  401ca5:	49 89 46 20          	mov    %rax,0x20(%r14)
  401ca9:	41 c7 46 28 76 65 72 	movl   $0x726576,0x28(%r14)
  401cb0:	00 
  401cb1:	44 89 e7             	mov    %r12d,%edi
  401cb4:	e8 b7 ee ff ff       	callq  400b70 <close@plt>
  401cb9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401cbe:	e9 95 03 00 00       	jmpq   402058 <submitr+0x7a8>
  401cc3:	44 89 a4 24 40 80 00 	mov    %r12d,0x8040(%rsp)
  401cca:	00 
  401ccb:	c7 84 24 44 80 00 00 	movl   $0x0,0x8044(%rsp)
  401cd2:	00 00 00 00 
  401cd6:	48 8d 84 24 50 80 00 	lea    0x8050(%rsp),%rax
  401cdd:	00 
  401cde:	48 89 84 24 48 80 00 	mov    %rax,0x8048(%rsp)
  401ce5:	00 
  401ce6:	ba 00 20 00 00       	mov    $0x2000,%edx
  401ceb:	48 8d b4 24 40 60 00 	lea    0x6040(%rsp),%rsi
  401cf2:	00 
  401cf3:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  401cfa:	00 
  401cfb:	e8 99 fa ff ff       	callq  401799 <rio_readlineb>
  401d00:	48 85 c0             	test   %rax,%rax
  401d03:	7f 74                	jg     401d79 <submitr+0x4c9>
  401d05:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401d0c:	3a 20 43 
  401d0f:	49 89 06             	mov    %rax,(%r14)
  401d12:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401d19:	20 75 6e 
  401d1c:	49 89 46 08          	mov    %rax,0x8(%r14)
  401d20:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401d27:	74 6f 20 
  401d2a:	49 89 46 10          	mov    %rax,0x10(%r14)
  401d2e:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  401d35:	66 69 72 
  401d38:	49 89 46 18          	mov    %rax,0x18(%r14)
  401d3c:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  401d43:	61 64 65 
  401d46:	49 89 46 20          	mov    %rax,0x20(%r14)
  401d4a:	48 b8 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rax
  401d51:	6d 20 73 
  401d54:	49 89 46 28          	mov    %rax,0x28(%r14)
  401d58:	41 c7 46 30 65 72 76 	movl   $0x65767265,0x30(%r14)
  401d5f:	65 
  401d60:	66 41 c7 46 34 72 00 	movw   $0x72,0x34(%r14)
  401d67:	44 89 e7             	mov    %r12d,%edi
  401d6a:	e8 01 ee ff ff       	callq  400b70 <close@plt>
  401d6f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401d74:	e9 df 02 00 00       	jmpq   402058 <submitr+0x7a8>
  401d79:	4c 8d 44 24 30       	lea    0x30(%rsp),%r8
  401d7e:	48 8d 8c 24 3c 20 00 	lea    0x203c(%rsp),%rcx
  401d85:	00 
  401d86:	48 8d 94 24 40 20 00 	lea    0x2040(%rsp),%rdx
  401d8d:	00 
  401d8e:	be 47 2c 40 00       	mov    $0x402c47,%esi
  401d93:	48 8d bc 24 40 60 00 	lea    0x6040(%rsp),%rdi
  401d9a:	00 
  401d9b:	b8 00 00 00 00       	mov    $0x0,%eax
  401da0:	e8 6b ee ff ff       	callq  400c10 <__isoc99_sscanf@plt>
  401da5:	8b 94 24 3c 20 00 00 	mov    0x203c(%rsp),%edx
  401dac:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  401db2:	0f 84 b2 00 00 00    	je     401e6a <submitr+0x5ba>
  401db8:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
  401dbd:	be 90 2b 40 00       	mov    $0x402b90,%esi
  401dc2:	4c 89 f7             	mov    %r14,%rdi
  401dc5:	b8 00 00 00 00       	mov    $0x0,%eax
  401dca:	e8 81 ee ff ff       	callq  400c50 <sprintf@plt>
  401dcf:	44 89 e7             	mov    %r12d,%edi
  401dd2:	e8 99 ed ff ff       	callq  400b70 <close@plt>
  401dd7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401ddc:	e9 77 02 00 00       	jmpq   402058 <submitr+0x7a8>
  401de1:	ba 00 20 00 00       	mov    $0x2000,%edx
  401de6:	48 8d b4 24 40 60 00 	lea    0x6040(%rsp),%rsi
  401ded:	00 
  401dee:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  401df5:	00 
  401df6:	e8 9e f9 ff ff       	callq  401799 <rio_readlineb>
  401dfb:	48 85 c0             	test   %rax,%rax
  401dfe:	7f 6a                	jg     401e6a <submitr+0x5ba>
  401e00:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401e07:	3a 20 43 
  401e0a:	49 89 06             	mov    %rax,(%r14)
  401e0d:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401e14:	20 75 6e 
  401e17:	49 89 46 08          	mov    %rax,0x8(%r14)
  401e1b:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401e22:	74 6f 20 
  401e25:	49 89 46 10          	mov    %rax,0x10(%r14)
  401e29:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  401e30:	68 65 61 
  401e33:	49 89 46 18          	mov    %rax,0x18(%r14)
  401e37:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  401e3e:	66 72 6f 
  401e41:	49 89 46 20          	mov    %rax,0x20(%r14)
  401e45:	48 b8 6d 20 73 65 72 	movabs $0x726576726573206d,%rax
  401e4c:	76 65 72 
  401e4f:	49 89 46 28          	mov    %rax,0x28(%r14)
  401e53:	41 c6 46 30 00       	movb   $0x0,0x30(%r14)
  401e58:	44 89 e7             	mov    %r12d,%edi
  401e5b:	e8 10 ed ff ff       	callq  400b70 <close@plt>
  401e60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401e65:	e9 ee 01 00 00       	jmpq   402058 <submitr+0x7a8>
  401e6a:	80 bc 24 40 60 00 00 	cmpb   $0xd,0x6040(%rsp)
  401e71:	0d 
  401e72:	0f 85 69 ff ff ff    	jne    401de1 <submitr+0x531>
  401e78:	80 bc 24 41 60 00 00 	cmpb   $0xa,0x6041(%rsp)
  401e7f:	0a 
  401e80:	0f 85 5b ff ff ff    	jne    401de1 <submitr+0x531>
  401e86:	80 bc 24 42 60 00 00 	cmpb   $0x0,0x6042(%rsp)
  401e8d:	00 
  401e8e:	0f 85 4d ff ff ff    	jne    401de1 <submitr+0x531>
  401e94:	ba 00 20 00 00       	mov    $0x2000,%edx
  401e99:	48 8d b4 24 40 60 00 	lea    0x6040(%rsp),%rsi
  401ea0:	00 
  401ea1:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  401ea8:	00 
  401ea9:	e8 eb f8 ff ff       	callq  401799 <rio_readlineb>
  401eae:	48 85 c0             	test   %rax,%rax
  401eb1:	7f 73                	jg     401f26 <submitr+0x676>
  401eb3:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401eba:	3a 20 43 
  401ebd:	49 89 06             	mov    %rax,(%r14)
  401ec0:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401ec7:	20 75 6e 
  401eca:	49 89 46 08          	mov    %rax,0x8(%r14)
  401ece:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401ed5:	74 6f 20 
  401ed8:	49 89 46 10          	mov    %rax,0x10(%r14)
  401edc:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  401ee3:	73 74 61 
  401ee6:	49 89 46 18          	mov    %rax,0x18(%r14)
  401eea:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  401ef1:	65 73 73 
  401ef4:	49 89 46 20          	mov    %rax,0x20(%r14)
  401ef8:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  401eff:	72 6f 6d 
  401f02:	49 89 46 28          	mov    %rax,0x28(%r14)
  401f06:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
  401f0d:	65 72 00 
  401f10:	49 89 46 30          	mov    %rax,0x30(%r14)
  401f14:	44 89 e7             	mov    %r12d,%edi
  401f17:	e8 54 ec ff ff       	callq  400b70 <close@plt>
  401f1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401f21:	e9 32 01 00 00       	jmpq   402058 <submitr+0x7a8>
  401f26:	48 8d b4 24 40 60 00 	lea    0x6040(%rsp),%rsi
  401f2d:	00 
  401f2e:	4c 89 f7             	mov    %r14,%rdi
  401f31:	e8 ea eb ff ff       	callq  400b20 <strcpy@plt>
  401f36:	44 89 e7             	mov    %r12d,%edi
  401f39:	e8 32 ec ff ff       	callq  400b70 <close@plt>
  401f3e:	41 0f b6 06          	movzbl (%r14),%eax
  401f42:	83 e8 4f             	sub    $0x4f,%eax
  401f45:	75 0f                	jne    401f56 <submitr+0x6a6>
  401f47:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
  401f4c:	83 e8 4b             	sub    $0x4b,%eax
  401f4f:	75 05                	jne    401f56 <submitr+0x6a6>
  401f51:	41 0f b6 46 02       	movzbl 0x2(%r14),%eax
  401f56:	85 c0                	test   %eax,%eax
  401f58:	0f 95 c0             	setne  %al
  401f5b:	0f b6 c0             	movzbl %al,%eax
  401f5e:	f7 d8                	neg    %eax
  401f60:	e9 f3 00 00 00       	jmpq   402058 <submitr+0x7a8>
  401f65:	48 8d 84 24 40 40 00 	lea    0x4040(%rsp),%rax
  401f6c:	00 
  401f6d:	48 89 04 24          	mov    %rax,(%rsp)
  401f71:	4d 89 f9             	mov    %r15,%r9
  401f74:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
  401f79:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  401f7e:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  401f83:	be c0 2b 40 00       	mov    $0x402bc0,%esi
  401f88:	48 8d bc 24 40 60 00 	lea    0x6040(%rsp),%rdi
  401f8f:	00 
  401f90:	b8 00 00 00 00       	mov    $0x0,%eax
  401f95:	e8 b6 ec ff ff       	callq  400c50 <sprintf@plt>
  401f9a:	48 8d bc 24 40 60 00 	lea    0x6040(%rsp),%rdi
  401fa1:	00 
  401fa2:	b8 00 00 00 00       	mov    $0x0,%eax
  401fa7:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401fae:	f2 ae                	repnz scas %es:(%rdi),%al
  401fb0:	48 f7 d1             	not    %rcx
  401fb3:	48 83 e9 01          	sub    $0x1,%rcx
  401fb7:	49 89 cd             	mov    %rcx,%r13
  401fba:	0f 84 03 fd ff ff    	je     401cc3 <submitr+0x413>
  401fc0:	48 89 cb             	mov    %rcx,%rbx
  401fc3:	48 8d ac 24 40 60 00 	lea    0x6040(%rsp),%rbp
  401fca:	00 
  401fcb:	e9 64 fc ff ff       	jmpq   401c34 <submitr+0x384>
  401fd0:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  401fd7:	3a 20 52 
  401fda:	49 89 06             	mov    %rax,(%r14)
  401fdd:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  401fe4:	20 73 74 
  401fe7:	49 89 46 08          	mov    %rax,0x8(%r14)
  401feb:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  401ff2:	63 6f 6e 
  401ff5:	49 89 46 10          	mov    %rax,0x10(%r14)
  401ff9:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  402000:	20 61 6e 
  402003:	49 89 46 18          	mov    %rax,0x18(%r14)
  402007:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  40200e:	67 61 6c 
  402011:	49 89 46 20          	mov    %rax,0x20(%r14)
  402015:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  40201c:	6e 70 72 
  40201f:	49 89 46 28          	mov    %rax,0x28(%r14)
  402023:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  40202a:	6c 65 20 
  40202d:	49 89 46 30          	mov    %rax,0x30(%r14)
  402031:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  402038:	63 74 65 
  40203b:	49 89 46 38          	mov    %rax,0x38(%r14)
  40203f:	66 41 c7 46 40 72 2e 	movw   $0x2e72,0x40(%r14)
  402046:	41 c6 46 42 00       	movb   $0x0,0x42(%r14)
  40204b:	44 89 e7             	mov    %r12d,%edi
  40204e:	e8 1d eb ff ff       	callq  400b70 <close@plt>
  402053:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402058:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
  40205f:	5b                   	pop    %rbx
  402060:	5d                   	pop    %rbp
  402061:	41 5c                	pop    %r12
  402063:	41 5d                	pop    %r13
  402065:	41 5e                	pop    %r14
  402067:	41 5f                	pop    %r15
  402069:	c3                   	retq   

000000000040206a <init_timeout>:
  40206a:	53                   	push   %rbx
  40206b:	89 fb                	mov    %edi,%ebx
  40206d:	85 ff                	test   %edi,%edi
  40206f:	74 1e                	je     40208f <init_timeout+0x25>
  402071:	be 70 17 40 00       	mov    $0x401770,%esi
  402076:	bf 0e 00 00 00       	mov    $0xe,%edi
  40207b:	e8 30 eb ff ff       	callq  400bb0 <signal@plt>
  402080:	85 db                	test   %ebx,%ebx
  402082:	bf 00 00 00 00       	mov    $0x0,%edi
  402087:	0f 49 fb             	cmovns %ebx,%edi
  40208a:	e8 d1 ea ff ff       	callq  400b60 <alarm@plt>
  40208f:	5b                   	pop    %rbx
  402090:	c3                   	retq   

0000000000402091 <init_driver>:
  402091:	55                   	push   %rbp
  402092:	53                   	push   %rbx
  402093:	48 83 ec 18          	sub    $0x18,%rsp
  402097:	48 89 fd             	mov    %rdi,%rbp
  40209a:	be 01 00 00 00       	mov    $0x1,%esi
  40209f:	bf 0d 00 00 00       	mov    $0xd,%edi
  4020a4:	e8 07 eb ff ff       	callq  400bb0 <signal@plt>
  4020a9:	be 01 00 00 00       	mov    $0x1,%esi
  4020ae:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4020b3:	e8 f8 ea ff ff       	callq  400bb0 <signal@plt>
  4020b8:	be 01 00 00 00       	mov    $0x1,%esi
  4020bd:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4020c2:	e8 e9 ea ff ff       	callq  400bb0 <signal@plt>
  4020c7:	ba 00 00 00 00       	mov    $0x0,%edx
  4020cc:	be 01 00 00 00       	mov    $0x1,%esi
  4020d1:	bf 02 00 00 00       	mov    $0x2,%edi
  4020d6:	e8 c5 eb ff ff       	callq  400ca0 <socket@plt>
  4020db:	89 c3                	mov    %eax,%ebx
  4020dd:	85 c0                	test   %eax,%eax
  4020df:	79 4f                	jns    402130 <init_driver+0x9f>
  4020e1:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4020e8:	3a 20 43 
  4020eb:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4020ef:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4020f6:	20 75 6e 
  4020f9:	48 89 45 08          	mov    %rax,0x8(%rbp)
  4020fd:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402104:	74 6f 20 
  402107:	48 89 45 10          	mov    %rax,0x10(%rbp)
  40210b:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402112:	65 20 73 
  402115:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402119:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402120:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402126:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40212b:	e9 f8 00 00 00       	jmpq   402228 <init_driver+0x197>
  402130:	bf 58 2c 40 00       	mov    $0x402c58,%edi
  402135:	e8 86 ea ff ff       	callq  400bc0 <gethostbyname@plt>
  40213a:	48 85 c0             	test   %rax,%rax
  40213d:	75 68                	jne    4021a7 <init_driver+0x116>
  40213f:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402146:	3a 20 44 
  402149:	48 89 45 00          	mov    %rax,0x0(%rbp)
  40214d:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402154:	20 75 6e 
  402157:	48 89 45 08          	mov    %rax,0x8(%rbp)
  40215b:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402162:	74 6f 20 
  402165:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402169:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402170:	76 65 20 
  402173:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402177:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  40217e:	72 20 61 
  402181:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402185:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  40218c:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402192:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402196:	89 df                	mov    %ebx,%edi
  402198:	e8 d3 e9 ff ff       	callq  400b70 <close@plt>
  40219d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4021a2:	e9 81 00 00 00       	jmpq   402228 <init_driver+0x197>
  4021a7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  4021ae:	00 
  4021af:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  4021b6:	00 00 
  4021b8:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  4021be:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4021c2:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  4021c7:	48 8b 40 18          	mov    0x18(%rax),%rax
  4021cb:	48 8b 38             	mov    (%rax),%rdi
  4021ce:	e8 4d ea ff ff       	callq  400c20 <bcopy@plt>
  4021d3:	66 c7 44 24 02 11 31 	movw   $0x3111,0x2(%rsp)
  4021da:	ba 10 00 00 00       	mov    $0x10,%edx
  4021df:	48 89 e6             	mov    %rsp,%rsi
  4021e2:	89 df                	mov    %ebx,%edi
  4021e4:	e8 87 ea ff ff       	callq  400c70 <connect@plt>
  4021e9:	85 c0                	test   %eax,%eax
  4021eb:	79 25                	jns    402212 <init_driver+0x181>
  4021ed:	ba 58 2c 40 00       	mov    $0x402c58,%edx
  4021f2:	be 18 2c 40 00       	mov    $0x402c18,%esi
  4021f7:	48 89 ef             	mov    %rbp,%rdi
  4021fa:	b8 00 00 00 00       	mov    $0x0,%eax
  4021ff:	e8 4c ea ff ff       	callq  400c50 <sprintf@plt>
  402204:	89 df                	mov    %ebx,%edi
  402206:	e8 65 e9 ff ff       	callq  400b70 <close@plt>
  40220b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402210:	eb 16                	jmp    402228 <init_driver+0x197>
  402212:	89 df                	mov    %ebx,%edi
  402214:	e8 57 e9 ff ff       	callq  400b70 <close@plt>
  402219:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  40221f:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402223:	b8 00 00 00 00       	mov    $0x0,%eax
  402228:	48 83 c4 18          	add    $0x18,%rsp
  40222c:	5b                   	pop    %rbx
  40222d:	5d                   	pop    %rbp
  40222e:	c3                   	retq   

000000000040222f <driver_post>:
  40222f:	53                   	push   %rbx
  402230:	48 83 ec 10          	sub    $0x10,%rsp
  402234:	4c 89 c3             	mov    %r8,%rbx
  402237:	85 c9                	test   %ecx,%ecx
  402239:	74 22                	je     40225d <driver_post+0x2e>
  40223b:	48 89 d6             	mov    %rdx,%rsi
  40223e:	bf 6c 2c 40 00       	mov    $0x402c6c,%edi
  402243:	b8 00 00 00 00       	mov    $0x0,%eax
  402248:	e8 03 e9 ff ff       	callq  400b50 <printf@plt>
  40224d:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402252:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402256:	b8 00 00 00 00       	mov    $0x0,%eax
  40225b:	eb 43                	jmp    4022a0 <driver_post+0x71>
  40225d:	48 85 ff             	test   %rdi,%rdi
  402260:	74 30                	je     402292 <driver_post+0x63>
  402262:	80 3f 00             	cmpb   $0x0,(%rdi)
  402265:	74 2b                	je     402292 <driver_post+0x63>
  402267:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
  40226c:	48 89 14 24          	mov    %rdx,(%rsp)
  402270:	41 b9 83 2c 40 00    	mov    $0x402c83,%r9d
  402276:	49 89 f0             	mov    %rsi,%r8
  402279:	48 89 f9             	mov    %rdi,%rcx
  40227c:	ba 8a 2c 40 00       	mov    $0x402c8a,%edx
  402281:	be 31 11 00 00       	mov    $0x1131,%esi
  402286:	bf 58 2c 40 00       	mov    $0x402c58,%edi
  40228b:	e8 20 f6 ff ff       	callq  4018b0 <submitr>
  402290:	eb 0e                	jmp    4022a0 <driver_post+0x71>
  402292:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402297:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  40229b:	b8 00 00 00 00       	mov    $0x0,%eax
  4022a0:	48 83 c4 10          	add    $0x10,%rsp
  4022a4:	5b                   	pop    %rbx
  4022a5:	c3                   	retq   
  4022a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4022ad:	00 00 00 

00000000004022b0 <__libc_csu_init>:
  4022b0:	41 57                	push   %r15
  4022b2:	41 89 ff             	mov    %edi,%r15d
  4022b5:	41 56                	push   %r14
  4022b7:	49 89 f6             	mov    %rsi,%r14
  4022ba:	41 55                	push   %r13
  4022bc:	49 89 d5             	mov    %rdx,%r13
  4022bf:	41 54                	push   %r12
  4022c1:	4c 8d 25 48 1b 20 00 	lea    0x201b48(%rip),%r12        # 603e10 <__frame_dummy_init_array_entry>
  4022c8:	55                   	push   %rbp
  4022c9:	48 8d 2d 48 1b 20 00 	lea    0x201b48(%rip),%rbp        # 603e18 <__init_array_end>
  4022d0:	53                   	push   %rbx
  4022d1:	4c 29 e5             	sub    %r12,%rbp
  4022d4:	31 db                	xor    %ebx,%ebx
  4022d6:	48 c1 fd 03          	sar    $0x3,%rbp
  4022da:	48 83 ec 08          	sub    $0x8,%rsp
  4022de:	e8 d5 e7 ff ff       	callq  400ab8 <_init>
  4022e3:	48 85 ed             	test   %rbp,%rbp
  4022e6:	74 1e                	je     402306 <__libc_csu_init+0x56>
  4022e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4022ef:	00 
  4022f0:	4c 89 ea             	mov    %r13,%rdx
  4022f3:	4c 89 f6             	mov    %r14,%rsi
  4022f6:	44 89 ff             	mov    %r15d,%edi
  4022f9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4022fd:	48 83 c3 01          	add    $0x1,%rbx
  402301:	48 39 eb             	cmp    %rbp,%rbx
  402304:	75 ea                	jne    4022f0 <__libc_csu_init+0x40>
  402306:	48 83 c4 08          	add    $0x8,%rsp
  40230a:	5b                   	pop    %rbx
  40230b:	5d                   	pop    %rbp
  40230c:	41 5c                	pop    %r12
  40230e:	41 5d                	pop    %r13
  402310:	41 5e                	pop    %r14
  402312:	41 5f                	pop    %r15
  402314:	c3                   	retq   
  402315:	90                   	nop
  402316:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40231d:	00 00 00 

0000000000402320 <__libc_csu_fini>:
  402320:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402324 <_fini>:
  402324:	48 83 ec 08          	sub    $0x8,%rsp
  402328:	48 83 c4 08          	add    $0x8,%rsp
  40232c:	c3                   	retq   
