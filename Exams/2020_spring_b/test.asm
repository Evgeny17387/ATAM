.global _start

.section text
_start:

    lea (%rip), %rax
    lea (%rip), %rbx

    ret
