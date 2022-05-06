.global main

.section .text
main:

    movq head, %r8
    movq $new_node, %r9
    movq new_node, %r10

    test %r8, %r8
    jnz ROOT_NOT_NULL

    movq %r9, head

    jmp END

ROOT_NOT_NULL:

    movq (%r8), %r11
    cmp %r11, %r10
    je END
    ja GO_TO_RIGHT
    jmp GO_TO_LEFT

GO_TO_RIGHT:

    movq 16(%r8), %r11
    test %r11, %r11
    jz INSERT_RIGHT_NODE

    movq %r11, %r8
    jmp ROOT_NOT_NULL

INSERT_RIGHT_NODE:
    
    movq %r9, 16(%r8)
    
    jmp END
    
GO_TO_LEFT:

    movq 8(%r8), %r11
    test %r11, %r11
    jz INSERT_LEFT_NODE

    movq %r11, %r8
    jmp ROOT_NOT_NULL

INSERT_LEFT_NODE:
    
    movq %r9, 8(%r8)
    
    jmp END

END:

    nop

    	cmpq $A, (head)
  	jne bad_exit
  	cmpq $20, (A)
  	jne bad_exit
  	cmpq $B, (A+0x08)
  	jne bad_exit
  	cmpq $C, (A+0x10)
  	jne bad_exit

  	cmpq $10, (B)
  	jne bad_exit
  	cmpq $0, (B+0x08)
  	jne bad_exit
  	cmpq $D, (B+0x10)
  	jne bad_exit

  	cmpq $26, (C)
  	jne bad_exit
  	cmpq $0, (C+0x08)
  	jne bad_exit
  	cmpq $new_node, (C+0x10)
  	jne bad_exit

  	cmpq $13, (D)
  	jne bad_exit
  	cmpq $0, (D+0x08)
  	jne bad_exit
  	cmpq $0, (D+0x10)
  	jne bad_exit

  	movq $60, %rax
  	movq $0, %rdi
  	syscall

bad_exit:
	movq $60, %rax
  	movq $1, %rdi
  	syscall

.section .data
head:
 .quad A
A:
 .quad 20
 .quad B
 .quad C
B:
 .quad 10
 .quad 0
 .quad D
C:
 .quad 26
 .quad 0
 .quad 0
D:
 .quad 13
 .quad 0
 .quad 0

new_node:
 .quad 30
 .quad 0
 .quad 0
