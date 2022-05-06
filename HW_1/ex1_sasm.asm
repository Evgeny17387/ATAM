.global main

.section .text
main:
    movq %rsp, %rbp #for correct debugging

    xor %ebx, %ebx

    movq num, %rax

LOOP_OVER_BITS:

    shr $1, %rax

    jae BIT_NOT_SET

    inc %ebx

BIT_NOT_SET:

    cmp $0, %rax

    je END

    jmp LOOP_OVER_BITS

END:

    movl %ebx, CountBits

    nop

.section .data
num: .quad 0b11
CountBits: .zero 4
