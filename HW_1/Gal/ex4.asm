.global _start

.section .text
_start:
movq $new_node,%rsi
movq root,%rdi
testq %rdi,%rdi
jnz loop_HW1
movq %rsi,root
jmp end_HW1
loop_HW1:testq %rdi,%rdi
jz enter_node_HW1
movq (%rdi),%rbx
movq (%rsi),%rax
movq %rdi,%r8 #backup enter adress
cmpq %rbx,%rax
je end_HW1
ja a_greater_b_HW1
cmovb 8(%rdi),%rdi
jmp loop_HW1
a_greater_b_HW1:movq 16(%rdi),%rdi
jmp loop_HW1
enter_node_HW1:movq (%rsi),%rax
leaq 8(%r8),%r9
leaq 16(%r8),%r10
cmpq (%r8),%rax
ja enter_node_a_greater_b_HW1
movq %rsi,(%r9)
jmp end_HW1
enter_node_a_greater_b_HW1:movq %rsi,(%r10)
end_HW1:
