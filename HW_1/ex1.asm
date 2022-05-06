.global _start

.section .text
_start:

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
