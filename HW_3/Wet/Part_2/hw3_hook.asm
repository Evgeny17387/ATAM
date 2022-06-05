.global hook

.section .data
msg: .ascii "This code was hacked by Ella Lee's gang\n"
endmsg:

.section .text
hook:

  mov $_start, %rsi
  add $0x1e, %rsi
  movb $0xc3, (%rsi)
  
  call _start

  mov    $0x1,%rax
  mov    $0x1,%rdi
  mov    $msg,%rsi
  mov    $0x29,%rdx
  syscall 

  mov $_start, %rsi
  add $0x1f, %rsi
  call *%rsi

  movq $60, %rax
  movq $0, %rdi
  syscall
