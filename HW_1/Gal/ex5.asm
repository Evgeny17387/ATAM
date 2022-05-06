.global _start

.section .text
_start:
movq head,%rsi
movq src, %rax
movq dst ,%rbx
cmpq %rax,%rbx
je end_HW1
testq %rsi,%rsi
jz end_HW1


xor %rcx,%rcx
count_src_HW1:test %rsi,%rsi
jz check_src_HW1
movq (%rsi),%r8
movq 8(%rsi),%rsi
cmpq %r8,%rax
jne count_src_HW1
incq %rcx
jmp count_src_HW1
check_src_HW1: cmpq $1,%rcx
jne end_HW1

movq head,%rsi
xor %rcx,%rcx
count_dst_HW1:test %rsi,%rsi
jz check_dst_HW1
movq (%rsi),%r8
movq 8(%rsi),%rsi
cmpq %r8,%rbx
jne count_dst_HW1
incq %rcx
jmp count_dst_HW1
check_dst_HW1: cmpq $1,%rcx
jne end_HW1

xor %rcx,%rcx
xor %r9,%r9
xor %r10,%r10
movq head,%rsi
cmpq (%rsi),%rax
je src_in_head_HW1

movq 8(%rsi),%rdi
find_src_HW1:cmpq (%rdi),%rax
je save_address_src_HW1
movq %rdi,%rsi
movq 8(%rsi),%rdi
jmp find_src_HW1

save_address_src_HW1: movq %rsi,%r9
movq %rdi,%r10
jmp find_dst_HW1

src_in_head_HW1:movq head,%r10
movq $1,%rcx

find_dst_HW1:xor %rdx,%rdx
xor %r11,%r11
xor %r12,%r12
movq head,%rsi
cmpq (%rsi),%rbx
je dst_in_head_HW1

movq 8(%rsi),%rdi
find_dst_loop_HW1:cmpq (%rdi),%rbx
je save_address_dst_HW1
movq %rdi,%rsi
movq 8(%rsi),%rdi
jmp find_dst_loop_HW1

save_address_dst_HW1: movq %rsi,%r11
movq %rdi,%r12
jmp switch_HW1

dst_in_head_HW1:movq head,%r12
movq $1,%rdx

switch_HW1: cmpq $1,%rcx
je switch_dst_to_head_HW1
cmpq $1,%rdx
je switch_src_to_head_HW1
cmpq 8(%r10),%r12
je src_dst_close_HW1
cmpq 8(%r12),%r10
je dst_src_close_HW1
movq 8(%r10),%r13 #backup old post_src
movq 8(%r12),%r14 #backup old post_dst

movq %r12,8(%r9) #point old pre_src to dst
movq %r13,8(%r12) #point dst to old post_src
movq %r10,8(%r11) #point old pre_dst to src
movq %r14,8(%r10) #point src to old post_dst 
jmp end_HW1

src_dst_close_HW1: 
movq 8(%r12),%r14 #backup old post_dst

movq %r12,8(%r9) #point old pre_src to dst
movq %r10,8(%r12)# point dst to src
movq %r14,8(%r10)#point src to old post_dst
jmp end_HW1

dst_src_close_HW1:
movq 8(%r10),%r13 #backup old post_src

movq %r10,8(%r11) #point old pre_dst to src
movq %r12,8(%r10)#point src to dst
movq %r13,8(%r12)# point dst to old post_src
jmp end_HW1

switch_dst_to_head_HW1:movq %r12,head
movq 8(%r10),%r13 #backup old post_src
movq 8(%r12),%r14 #backup old post_dst
movq %r10,8(%r11) #point old pre_dst to src
movq %r13,8(%r12) #point dst to old post_src
movq %r14,8(%r10) #point src to old post_dst
jmp end_HW1

switch_src_to_head_HW1:movq %r10,head
movq 8(%r10),%r13 #backup old post_src
movq 8(%r12),%r14 #backup old post_dst
movq %r14,8(%r10) #point src to old post_dst
movq %r12,8(%r9)  #point old pre_src to dst
movq %r13,8(%r12) #point dst to old pre_src

end_HW1:
