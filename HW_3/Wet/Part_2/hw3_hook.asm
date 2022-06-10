.global hook

.section .data
msg: .ascii "This code was hacked by Ella Lee's gang\n"
endmsg:
lengthmsg: .quad endmsg - msg

.section .text
hook:

  mov $_start, %rsi
  add $0x1e, %rsi
  movb $0xc3, (%rsi)
  
  call _start

  pushq %rax
  pushq %rsi
  pushq %rdx
  pushq %rdi
  pushq %rcx
  pushq %r11

  mov $0x1,%rax
  mov $0x1,%rdi
  mov $msg,%rsi
  movq lengthmsg,%rdx

  syscall 

  popq %r11
  popq %rcx
  popq %rdi
  popq %rdx
  popq %rsi
  popq %rax

  mov $_start, %rsi
  add $0x1f, %rsi
  call *%rsi
