.global main

.section .text
main:

    xor %eax, %eax
    movl $1, %edx

    movl num, %ecx

    cmp $0, %ecx
    je END
    jl COPY_NEGATIVE

    lea source, %esi
    lea destination, %edi
    
    jmp CONTINUE_INIT

COPY_NEGATIVE:

    not %ecx
    inc %ecx

    lea destination, %esi
    lea source, %edi
    
CONTINUE_INIT:
    
    cmp %edi, %esi
    jg LOOP_ARRAY

    movl %ecx, %eax
    dec %eax
    movl $-1, %edx

LOOP_ARRAY:

    lea (%esi, %eax), %r8
    lea (%edi, %eax), %r9

    movb (%r8), %bl
    movb %bl, (%r9)

    add %edx, %eax

    loop LOOP_ARRAY

END:

    nop

    cmpl $0xCCBBCCDD, (destination)
    jne bad_exit
    cmpl $0xAABBCCBB, (source)
    jne bad_exit

    movq $60, %rax
    movq $0, %rdi
    syscall

bad_exit:

    movq $60, %rax
    movq $1, %rdi
    syscall

.section .data
destination: .short 0xCAFE
source: .quad 0xAABBCCDD
num: .long 0x3
