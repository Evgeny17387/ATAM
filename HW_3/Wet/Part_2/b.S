0000000000000000 <ending>:
   0:	48 c7 c0 01 00 00 00 	mov    $0x1,%rax
   7:	48 c7 c7 01 00 00 00 	mov    $0x1,%rdi
   e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
  15:	48 c7 c2 04 00 00 00 	mov    $0x4,%rdx
  1c:	0f 05                	syscall 
  1e:	c3                   	retq   

Disassembly of section .data:

0000000000000000 <msg>:
   0:	62                   	.byte 0x62
   1:	79 65                	jns    68 <endmsg+0x64>
   3:	0a                   	.byte 0xa
