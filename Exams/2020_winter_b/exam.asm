
.section .data
msg:        .ascii  "Only 6 minutes left\n"
msg_len:    .quad   msg_len - msg

.section .text
.global _start
_start:
    movq    $53,        %rbx
    movq    $5,         %r8
    leaq    msg,        %r9
    movb    %bl,        (%r9, %r8, 1)

    movq    $1,         %rax
    movq    $1,         %rdi
    movq    $msg,       %rsi
    movq    (msg_len),  %rdx
    syscall

    movq    $60,        %rax
    movq    $0,          %rdi
    syscall
