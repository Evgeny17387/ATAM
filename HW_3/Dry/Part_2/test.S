.global main

.section .text
main:

#    pop %rdi
#    ret

#    pop %rax
#    ret

#    syscall

#    pop %rsi
#    pop %r15
#    ret

#    push %rbp
#    mov $0x602e20, %edi
#    mov %rsp, %rbp
#    call *%rax

    add %r15, %rdi
    ret
