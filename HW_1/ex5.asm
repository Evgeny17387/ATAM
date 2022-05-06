.global _start

.section .text
_start:

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
