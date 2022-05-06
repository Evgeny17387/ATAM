
.global _start

.section .text

# tree layout: (new_node value will be surrounded by | | if inserted)
#  4___                                    
#      \                                   
#     127____________________________      
#    /                               \     
#   22                    __________488_   
#                        /              \  
#          _____________342_______     496 
#         /                       \        
#        132_______          ____458       
#                  \        /              
#             ____235_     356_            
#            /        \        \           
#           146_     268      417          
#               \                          
#              214                        

test_start:
    
    cmpq $4, (node_0)
    jne bad_exit
    cmpq $0, (node_0+8)
    jne bad_exit
    cmpq $node_1, (node_0+16)
    jne bad_exit

    cmpq $127, (node_1)
    jne bad_exit
    cmpq $node_7, (node_1+8)
    jne bad_exit
    cmpq $node_2, (node_1+16)
    jne bad_exit

    cmpq $488, (node_2)
    jne bad_exit
    cmpq $node_3, (node_2+8)
    jne bad_exit
    cmpq $node_9, (node_2+16)
    jne bad_exit

    cmpq $342, (node_3)
    jne bad_exit
    cmpq $node_4, (node_3+8)
    jne bad_exit
    cmpq $node_6, (node_3+16)
    jne bad_exit

    cmpq $132, (node_4)
    jne bad_exit
    cmpq $0, (node_4+8)
    jne bad_exit
    cmpq $node_5, (node_4+16)
    jne bad_exit

    cmpq $235, (node_5)
    jne bad_exit
    cmpq $node_8, (node_5+8)
    jne bad_exit
    cmpq $node_10, (node_5+16)
    jne bad_exit

    cmpq $458, (node_6)
    jne bad_exit
    cmpq $node_11, (node_6+8)
    jne bad_exit
    cmpq $0, (node_6+16)
    jne bad_exit

    cmpq $22, (node_7)
    jne bad_exit
    cmpq $0, (node_7+8)
    jne bad_exit
    cmpq $0, (node_7+16)
    jne bad_exit

    cmpq $146, (node_8)
    jne bad_exit
    cmpq $0, (node_8+8)
    jne bad_exit
    cmpq $node_12, (node_8+16)
    jne bad_exit

    cmpq $496, (node_9)
    jne bad_exit
    cmpq $0, (node_9+8)
    jne bad_exit
    cmpq $0, (node_9+16)
    jne bad_exit

    cmpq $268, (node_10)
    jne bad_exit
    cmpq $0, (node_10+8)
    jne bad_exit
    cmpq $0, (node_10+16)
    jne bad_exit

    cmpq $356, (node_11)
    jne bad_exit
    cmpq $0, (node_11+8)
    jne bad_exit
    cmpq $node_13, (node_11+16)
    jne bad_exit

    cmpq $214, (node_12)
    jne bad_exit
    cmpq $0, (node_12+8)
    jne bad_exit
    cmpq $0, (node_12+16)
    jne bad_exit

    cmpq $417, (node_13)
    jne bad_exit
    cmpq $0, (node_13+8)
    jne bad_exit
    cmpq $0, (node_13+16)
    jne bad_exit

    cmpq $235, (new_node)
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
 .quad 4
 .quad 0
 .quad node_1
node_1:
 .quad 127
 .quad node_7
 .quad node_2
node_2:
 .quad 488
 .quad node_3
 .quad node_9
node_3:
 .quad 342
 .quad node_4
 .quad node_6
node_4:
 .quad 132
 .quad 0
 .quad node_5
node_5:
 .quad 235
 .quad node_8
 .quad node_10
node_6:
 .quad 458
 .quad node_11
 .quad 0
node_7:
 .quad 22
 .quad 0
 .quad 0
node_8:
 .quad 146
 .quad 0
 .quad node_12
node_9:
 .quad 496
 .quad 0
 .quad 0
node_10:
 .quad 268
 .quad 0
 .quad 0
node_11:
 .quad 356
 .quad 0
 .quad node_13
node_12:
 .quad 214
 .quad 0
 .quad 0
node_13:
 .quad 417
 .quad 0
 .quad 0
new_node:
 .quad 235
 .quad 0
 .quad 0

