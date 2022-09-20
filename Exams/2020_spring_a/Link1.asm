
.extern h

.global func, msg, msg_len

.section .data
msg:        .ascii  "file 1"
msg_len:    .quad   msg_len - msg
m:          .quad   5

.section .text
func:
    mov     $h,         %rax
    mov     msg_len,    %rbx
    mov     m,          %rax
    ret
