.global _start

.section .text

_start:

xor %eax, %eax
movq num, %rbx

loop_over_bits:

shr %rbx
jnc bit_is_0
inc %eax

bit_is_0:

test %rbx, %rbx
jnz loop_over_bits

movl %eax, CountBits
