.global main

.section .text
main:

    movq src, %r8
    movq dst, %r9

    cmp %r8, %r9
    je END

    movq head, %r10
    movq $head, %rax

    xor %r12, %r12
    xor %r14, %r14

LOOP_OVER_LIST:

    cmpq $0, %r10
    je REPLACE

    movq (%r10), %r11

    cmpq %r11, %r8
    jne NOT_EQAUL_SRC

    incq %r12
    movq %r10, %r13
    movq %rax, %rsi

NOT_EQAUL_SRC:

    cmpq %r11, %r9
    jne NOT_EQAUL_DST
    
    incq %r14
    movq %r10, %r15
    movq %rax, %rdi

NOT_EQAUL_DST:
    
    lea 8(%r10), %rax
    movq 8(%r10), %r10

    jmp LOOP_OVER_LIST
    
REPLACE:

    cmpq $1, %r12
    jne END

    cmpq $1, %r14
    jne END

    movq 8(%r13), %rbx
    movq 8(%r15), %rcx

    cmpq %rbx, %r15
    je SRC_TO_DST

    cmpq %rcx, %r13
    je DST_TO_SRC

    movq %r13, (%rdi)
    movq %r15, (%rsi)

    movq %rcx, 8(%r13)
    movq %rbx, 8(%r15)

    jmp END

SRC_TO_DST:

    movq %r15, (%rsi)
    movq %rcx, 8(%r13)
    movq %r13, 8(%r15)

    jmp END

DST_TO_SRC:

    movq %r13, (%rdi)
    movq %rbx, 8(%r15)
    movq %r15, 8(%r13)

    jmp END

END:

    nop
  
  cmpq $BNode, head
  jne bad
  cmpq $5, ANode
  jne bad
  cmpq $NULL, ANode+8
  jne bad
  cmpq $4, BNode
  jne bad
  cmpq $ANode, BNode+8
  jne bad
correct:
  movq $60, %rax
  movq $0, %rdi
  syscall
bad:
  movq $60, %rax
  movq $1, %rdi
  syscall
  
  
.section .data
src: .quad 5
dst: .quad 4
head: .quad ANode
ANode:  .quad 5
    .quad BNode
BNode:  .quad 4
    .quad NULL
.set NULL, 0
