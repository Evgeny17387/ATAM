.global _start

.section .text
_start:

    movq root, %r8
    movq $new_node, %r9
    movq new_node, %r10

    test %r8, %r8
    jnz ROOT_NOT_NULL

    movq %r9, root

    jmp END

ROOT_NOT_NULL:

    movq (%r8), %r11
    cmp %r11, %r10
    je END
    ja GO_TO_RIGHT
    jmp GO_TO_LEFT

GO_TO_RIGHT:

    movq 16(%r8), %r11
    test %r11, %r11
    jz INSERT_RIGHT_NODE

    movq %r11, %r8
    jmp ROOT_NOT_NULL

INSERT_RIGHT_NODE:
    
    movq %r9, 16(%r8)
    
    jmp END
    
GO_TO_LEFT:

    movq 8(%r8), %r11
    test %r11, %r11
    jz INSERT_LEFT_NODE

    movq %r11, %r8
    jmp ROOT_NOT_NULL

INSERT_LEFT_NODE:
    
    movq %r9, 8(%r8)
    
    jmp END

END:
