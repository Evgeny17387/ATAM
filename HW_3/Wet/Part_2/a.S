0000000000000000 <_start>:
   0:	48 c7 c0 01 00 00 00 	mov    $0x1,%rax
   7:	48 c7 c7 01 00 00 00 	mov    $0x1,%rdi
   e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
  15:	48 c7 c2 06 00 00 00 	mov    $0x6,%rdx
  1c:	0f 05                	syscall 
  1e:	90                   	nop -> ret
  1f:	90                   	nop
  20:	90                   	nop
  21:	90                   	nop
  22:	90                   	nop
  23:	90                   	nop
  24:	90                   	nop
  25:	90                   	nop
  26:	e8 00 00 00 00       	callq  2b <_start+0x2b>
  2b:	48 c7 c0 3c 00 00 00 	mov    $0x3c,%rax
  32:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
  39:	0f 05                	syscall 

Disassembly of section .data:

0000000000000000 <buff>:
	...

0000000000000008 <msg>:
   8:	68 65 6c 6c 6f       	pushq  $0x6f6c6c65
   d:	0a                   	.byte 0xa
