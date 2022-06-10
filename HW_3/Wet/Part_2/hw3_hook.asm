.global hook

.section .data
msg: .ascii "This code was hacked by Ella Lee's gang\n"
endmsg:

.section .text
hook:

  mov $_start, %rsi

  add $0x1e, %rsi
  movb $0xff, (%rsi)

  inc %rsi
  movb $0x24, (%rsi)

  inc %rsi
  movb $0x25, (%rsi)

  inc %rsi
  movl $buff, (%rsi)

  mov $print_masssge, %rsi
  movq %rsi, (buff)

  jmp _start

print_masssge:

  pushq %rax
  pushq %rcx
  pushq %rdx
  pushq %rsi
  pushq %rdi
  pushq %r11

  mov $0x1,%rax
  mov $0x1,%rdi
  mov $msg,%rsi
  movq $0x28,%rdx

  syscall 

  popq %r11
  popq %rdi
  popq %rsi
  popq %rdx
  popq %rcx
  popq %rax

  mov $_start, %rsi
  add $0x26, %rsi
  call *%rsi
