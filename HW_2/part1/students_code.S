.global hamming_weight, negate_first_k, bring_balance_to_the_word, read_input

.section .bss
.lcomm path, 1024

.section .data
file_descriptor:    .quad 0
file_buffer:        .fill 8, 1, 0
length:             .quad 0

.section .text

# -----------------------------------------------------------------------------------

read_input:

  # Prolog
  pushq %rbp
  movq %rsp, %rbp

  # Save input parameter in local variable
  subq $8, %rsp
  movq %rdi,(%rsp)

  # Get file name
  lea path(%rip), %rdi
  call get_path

  # Open file
  movq $2, %rax
  movq $0, %rsi
  syscall
  movq %rax, file_descriptor(%rip)

  call read_8_bytes

  # Convert size string to long
  lea file_buffer(%rip), %rdi
  call atam_atol
  movq %rax, length(%rip)

  # Move cursor to beggining of code word
  lea file_buffer(%rip), %rdi
  xor %rcx, %rcx

LOOP1:

  movb (%rdi,%rcx), %dl
  cmp $0xa, %dl
  je CONTINUE1
  inc %rcx
  jmp LOOP1

CONTINUE1:

  # Move bytes to return output
  movq %rdi, %r10
  movq %rcx, %r11
  inc %r11
  movq (%rsp), %r8
  xor %r9, %r9

LOOP2:

  cmpq length(%rip), %r9
  je CONTINUE2
  
  cmp $8, %r11
  jne CONTINUE3
  
  call read_8_bytes
  
  xor %r11, %r11

  jmp LOOP2

CONTINUE3:

  movb (%r10,%r11), %dl
  movb %dl, (%r8, %r9)

  inc %r11
  inc %r9
  
  jmp LOOP2

CONTINUE2:

  # Close file
  movq $3, %rax
  movq file_descriptor(%rip), %rdi
  syscall

  # Return length in 8'th
  movq length(%rip), %rax
  movq $8, %r8
  div %r8

  # Epilog
  movq %rbp, %rsp
  popq %rbp
  ret

read_8_bytes:

  movq $0, %rax
  movq file_descriptor(%rip), %rdi
  lea file_buffer(%rip), %rsi
  movq $8, %rdx
  syscall
  ret

# -----------------------------------------------------------------------------------

hamming_weight:

  xor %r8, %r8
  xor %r9, %r9

  movq %rdi, %r10

LOOP_OVER_QUADS:

  cmp %r8, %rsi
  je CONTINUE4

  movq (%r10, %r8, 8), %rdi

  call count_bits_quad

  add %rax, %r9

  inc %r8

  jmp LOOP_OVER_QUADS

CONTINUE4:

  movq %r9, %rax
  ret

count_bits_quad:

  xor %rax, %rax

LOOP_OVER_BITS:

  shr $1, %rdi
  jae BIT_NOT_SET

  inc %rax

BIT_NOT_SET:

  cmp $0, %rdi
  je END
  jmp LOOP_OVER_BITS

END:

  ret

# -----------------------------------------------------------------------------------

negate_first_k:

  xor %rax, %rax
  xor %r9, %r9

LOOP_BUILD_NOT_MASK:
  
  cmp %r9, %rsi
  je CONTINUE5
  
  shl $1, %rax
  add $1, %rax
 
  inc %r9
  jmp LOOP_BUILD_NOT_MASK

CONTINUE5:

  xor %rdi, %rax
  ret

# -----------------------------------------------------------------------------------

bring_balance_to_the_word:

  pushq %r12

  movq %rsi, %r12
  shl $5, %r12

  xor %rdx, %rdx
  xor %rcx, %rcx
  xor %r8, %r8

LOOP6:

  pushq %r8
  pushq %rdx
  pushq %rcx
  call negate_k_bits
  popq %rcx
  popq %rdx
  popq %r8

  pushq %rsi
  pushq %rdi
  pushq %r8
  pushq %rdx
  pushq %rcx
  call hamming_weight
  popq %rcx
  popq %rdx
  popq %r8
  popq %rdi
  popq %rsi

  cmp %rax, %r12
  je CONTINUE6

  pushq %r8
  pushq %rdx
  pushq %rcx
  call negate_k_bits
  popq %rcx
  popq %rdx
  popq %r8

  inc %rdx
  inc %rcx
  cmp $64, %rcx
  je CONTINUE7
  jmp LOOP6

CONTINUE7:

  xor %rcx, %rcx
  inc %r8
  jmp LOOP6

CONTINUE6:

  movq %rdx, %rax
  popq %r12
  ret

negate_k_bits:

  pushq %r13

  xor %r13, %r13

LOOP8:

  cmp %r8, %r13
  je CONTINUE9

  pushq %rsi
  pushq %rdi
  movq (%rdi, %r13, 8), %rdi
  movq $64, %rsi
  call negate_first_k
  popq %rdi
  popq %rsi

  movq %rax, (%rdi, %r13, 8)

  inc %r13
  jmp LOOP8

CONTINUE9:

  pushq %rsi
  pushq %rdi
  movq (%rdi, %r13, 8), %rdi
  movq %rcx, %rsi
  call negate_first_k
  popq %rdi
  popq %rsi

  movq %rax, (%rdi, %r13, 8)

CONTINUE8:

  popq %r13
  ret
