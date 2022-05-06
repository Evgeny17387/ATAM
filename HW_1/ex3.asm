.global _start

.section .text
_start:

    lea array1, %r8
    lea array2, %r9
    lea mergedArray, %r10

    movl (%r8), %eax
    movl (%r9), %ebx

    cmpl $0, %eax
    je LOOP_OVER_ARRAY2

    cmpl $0, %ebx
    je LOOP_OVER_ARRAY1
    
    cmpl %eax, %ebx
    ja ARRAY2_ABOVE
    jb ARRAY1_ABOVE

    movl %eax, (%r10)
    add $4, %r8
    add $4, %r10

LOOP_OVER_BOTH:
    
    movl (%r8), %eax
    movl (%r9), %ebx
    movl -4(%r10), %ecx

    cmpl $0, %eax
    je LOOP_OVER_ARRAY2

    cmpl $0, %ebx
    je LOOP_OVER_ARRAY1

    cmpl %eax, %ecx
    je ARRAY1_SKIP

    cmpl %ebx, %ecx
    je ARRAY2_SKIP
    
    cmpl %eax, %ebx
    ja ARRAY2_ABOVE
    jb ARRAY1_ABOVE

    movl %eax, (%r10)
    add $4, %r8
    add $4, %r10
    
    jmp LOOP_OVER_BOTH

LOOP_OVER_ARRAY1:
    
    movl (%r8), %eax
    movl -4(%r10), %ecx

    cmpl $0, %eax
    je END

    cmpl %ecx, %eax
    jne LOOP_OVER_ARRAY1_INSERT
    
    add $4, %r8
    jmp LOOP_OVER_ARRAY1

LOOP_OVER_ARRAY1_INSERT:

    movl %eax, (%r10)

    add $4, %r8
    add $4, %r10

    jmp LOOP_OVER_ARRAY1

LOOP_OVER_ARRAY2:

    movl (%r9), %ebx
    movl -4(%r10), %ecx

    cmpl $0, %ebx
    je END

    cmpl %ecx, %ebx
    jne LOOP_OVER_ARRAY2_INSERT
    
    add $4, %r9
    jmp LOOP_OVER_ARRAY2

LOOP_OVER_ARRAY2_INSERT:

    movl %ebx, (%r10)

    add $4, %r9
    add $4, %r10

    jmp LOOP_OVER_ARRAY2

ARRAY1_SKIP:

    add $4, %r8

    jmp LOOP_OVER_BOTH

ARRAY2_SKIP:

    add $4, %r9

    jmp LOOP_OVER_BOTH

ARRAY2_ABOVE:

    movl %ebx, (%r10)
    add $4, %r9
    add $4, %r10

    jmp LOOP_OVER_BOTH

ARRAY1_ABOVE:

    movl %eax, (%r10)
    add $4, %r8
    add $4, %r10

    jmp LOOP_OVER_BOTH

END:

    movl $0, (%r10)
