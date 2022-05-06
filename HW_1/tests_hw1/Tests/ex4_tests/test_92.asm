
.global _start

.section .text

# tree layout: (new_node value will be surrounded by | | if inserted)
#  82__________________________         
#                              \        
#                       ______374_      
#                      /          \     
#                    _302__      472_   
#                   /      \         \  
#      ____________234   |307|      476 
#     /                                 
#    83____                             
#          \                            
#        _197____                       
#       /        \                      
#      113     _233                     
#             /                         
#            225                       

test_start:
    
    cmpq $82, (node_0)
    jne bad_exit
    cmpq $0, (node_0+8)
    jne bad_exit
    cmpq $node_1, (node_0+16)
    jne bad_exit

    cmpq $374, (node_1)
    jne bad_exit
    cmpq $node_3, (node_1+8)
    jne bad_exit
    cmpq $node_2, (node_1+16)
    jne bad_exit

    cmpq $472, (node_2)
    jne bad_exit
    cmpq $0, (node_2+8)
    jne bad_exit
    cmpq $node_6, (node_2+16)
    jne bad_exit

    cmpq $302, (node_3)
    jne bad_exit
    cmpq $node_4, (node_3+8)
    jne bad_exit
    cmpq $new_node, (node_3+16)
    jne bad_exit

    cmpq $234, (node_4)
    jne bad_exit
    cmpq $node_5, (node_4+8)
    jne bad_exit
    cmpq $0, (node_4+16)
    jne bad_exit

    cmpq $83, (node_5)
    jne bad_exit
    cmpq $0, (node_5+8)
    jne bad_exit
    cmpq $node_7, (node_5+16)
    jne bad_exit

    cmpq $476, (node_6)
    jne bad_exit
    cmpq $0, (node_6+8)
    jne bad_exit
    cmpq $0, (node_6+16)
    jne bad_exit

    cmpq $197, (node_7)
    jne bad_exit
    cmpq $node_9, (node_7+8)
    jne bad_exit
    cmpq $node_8, (node_7+16)
    jne bad_exit

    cmpq $233, (node_8)
    jne bad_exit
    cmpq $node_10, (node_8+8)
    jne bad_exit
    cmpq $0, (node_8+16)
    jne bad_exit

    cmpq $113, (node_9)
    jne bad_exit
    cmpq $0, (node_9+8)
    jne bad_exit
    cmpq $0, (node_9+16)
    jne bad_exit

    cmpq $225, (node_10)
    jne bad_exit
    cmpq $0, (node_10+8)
    jne bad_exit
    cmpq $0, (node_10+16)
    jne bad_exit

    cmpq $225, (new_node)
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
 .quad 82
 .quad 0
 .quad node_1
node_1:
 .quad 374
 .quad node_3
 .quad node_2
node_2:
 .quad 472
 .quad 0
 .quad node_6
node_3:
 .quad 302
 .quad node_4
 .quad new_node
node_4:
 .quad 234
 .quad node_5
 .quad 0
node_5:
 .quad 83
 .quad 0
 .quad node_7
node_6:
 .quad 476
 .quad 0
 .quad 0
node_7:
 .quad 197
 .quad node_9
 .quad node_8
node_8:
 .quad 233
 .quad node_10
 .quad 0
node_9:
 .quad 113
 .quad 0
 .quad 0
node_10:
 .quad 225
 .quad 0
 .quad 0
new_node:
 .quad 225
 .quad 0
 .quad 0

