.global _start

.section .text
_start:
movq $array1, %r8 
movq $array2, %r9
movq $mergedArray, %r10
xor %rcx,%rcx

main_loop_HW1:
incq %rcx
movl (%r8),%eax
movl (%r9),%ebx 
testl %eax,%eax
jz rest_array_2_HW1
testl %ebx,%ebx
jz rest_array_1_HW1

cmpl %ebx,%eax
ja a_greater_b_HW1
cmpq $1,%rcx
je first_for_b_HW1
cmpl %ebx,-4(%r10)
je promote_array2_HW1
movl %ebx,(%r10)
jmp promote_array2_mixed_array_HW1
first_for_b_HW1:movl %ebx,(%r10)
promote_array2_mixed_array_HW1: addq $0x4,%r10
promote_array2_HW1: addq $0x4,%r9
jmp main_loop_HW1


a_greater_b_HW1:
cmpq $1,%rcx
je first_for_a_HW1
cmpl %eax,-4(%r10)
je promote_array1_HW1
movl %eax,(%r10)
jmp promote_array1_mixed_array_HW1
first_for_a_HW1:movl %eax,(%r10)
promote_array1_mixed_array_HW1: addq $0x4,%r10
promote_array1_HW1: addq $0x4,%r8
jmp main_loop_HW1


rest_array_2_HW1:testl %ebx,%ebx
jz end
incq %rcx
cmpq $1,%rcx
je first_for_b_rest_HW1
cmpl %ebx,-4(%r10)
je promote_array2_rest_HW1
movl %ebx,(%r10)
jmp promote_array1_mixed_array_rest_HW1
first_for_b_rest_HW1:movl %ebx,(%r10)
promote_array2_mixed_array_rest_HW1: addq $0x4,%r10
promote_array2_rest_HW1: addq $0x4,%r9
movl (%r9),%ebx
jmp rest_array_2_HW1


rest_array_1_HW1:testl %eax,%eax
jz end
incq %rcx
cmpq $1,%rcx
je first_for_a_rest_HW1
cmpl %eax,-4(%r10)
je promote_array1_rest_HW1
movl %eax,(%r10)
jmp promote_array1_mixed_array_rest_HW1
first_for_a_rest_HW1:movl %eax,(%r10)
promote_array1_mixed_array_rest_HW1: addq $0x4,%r10
promote_array1_rest_HW1: addq $0x4,%r8
movl (%r8),%eax
jmp rest_array_1_HW1

end:movl $0,(%r10)
