
.global _start

.section .text

# tree layout: (new_node value will be surrounded by | | if inserted)
#    _______292_         
#   /           \        
#  121____     304____   
#         \           \  
#       _212        _479 
#      /           /     
#     184         384   

test_start:
    
    cmpq $292, (node_0)
    jne bad_exit
    cmpq $node_1, (node_0+8)
    jne bad_exit
    cmpq $node_2, (node_0+16)
    jne bad_exit

    cmpq $121, (node_1)
    jne bad_exit
    cmpq $0, (node_1+8)
    jne bad_exit
    cmpq $node_5, (node_1+16)
    jne bad_exit

    cmpq $304, (node_2)
    jne bad_exit
    cmpq $0, (node_2+8)
    jne bad_exit
    cmpq $node_3, (node_2+16)
    jne bad_exit

    cmpq $479, (node_3)
    jne bad_exit
    cmpq $node_4, (node_3+8)
    jne bad_exit
    cmpq $0, (node_3+16)
    jne bad_exit

    cmpq $384, (node_4)
    jne bad_exit
    cmpq $0, (node_4+8)
    jne bad_exit
    cmpq $0, (node_4+16)
    jne bad_exit

    cmpq $212, (node_5)
    jne bad_exit
    cmpq $node_6, (node_5+8)
    jne bad_exit
    cmpq $0, (node_5+16)
    jne bad_exit

    cmpq $184, (node_6)
    jne bad_exit
    cmpq $0, (node_6+8)
    jne bad_exit
    cmpq $0, (node_6+16)
    jne bad_exit

    cmpq $184, (new_node)
    jne bad_exit
    cmpq $0, (new_node+8)
    jne bad_exit
    cmpq $0, (new_node+16)
    jne bad_exit


    movq $60, %rax
    movq $0, %rdi
    syscall

bad_exit:
    movq $60, %rax
    movq $1, %rdi
    syscall

.section .data
root:
 .quad node_0
node_0:
 .quad 292
 .quad node_1
 .quad node_2
node_1:
 .quad 121
 .quad 0
 .quad node_5
node_2:
 .quad 304
 .quad 0
 .quad node_3
node_3:
 .quad 479
 .quad node_4
 .quad 0
node_4:
 .quad 384
 .quad 0
 .quad 0
node_5:
 .quad 212
 .quad node_6
 .quad 0
node_6:
 .quad 184
 .quad 0
 .quad 0
new_node:
 .quad 184
 .quad 0
 .quad 0

