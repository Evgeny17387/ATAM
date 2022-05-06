.global main

.section .data
code_word: .quad  0xff00ff0000f0ff, 0xff000000fe
#code_word: .quad  0x00000000FFFFFFFE, 0x00000000FFFFFFFF
#code_word: .quad  0x00000000FFFFFFFE

.section .text
main:

    movq %rsp, %rbp

    lea code_word(%rip), %rdi
    movq $2, %rsi

    call bring_balance_to_the_word

    ret

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
