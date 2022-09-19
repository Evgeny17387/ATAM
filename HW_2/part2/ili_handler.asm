.globl my_ili_handler

.text
.align 4, 0x90
my_ili_handler:
  ####### Some smart student's code here #######
  pushq %rax
  pushq %rbx
  pushq %rcx
  pushq %rdx
  pushq %rsi 
  pushq %rbp
  pushq %r8
  pushq %r9
  pushq %r10
  pushq %r11
  pushq %r12
  pushq %r13
  pushq %r14
  pushq %r15
  pushq %rdi  
  

  
   movq 120(%rsp),%r9
   movb (%r9),%r10b
   cmpb $0x0f,%r10b
   jne size_1_HW2
   #op code size is 2 bytes
   movq $2,%rcx
   movw (%r9),%r10w 
   movw $0xff00,%r11w #masking the second byte 
   andw %r11w,%r10w
   shr $8,%r10w
   xor %rdi,%rdi
   movb %r10b,%dil
   call what_to_do   
   cmpq $0,%rax
   jne  ret_val_not_zero_hw2
   jmp  ret_val_zero_hw2
   
   
    size_1_HW2:#op code size is 1 byte 
    movq $1 ,%rcx
    movb (%r9),%r10b
    xor %rdi,%rdi
    movb %r10b,%dil
    call what_to_do    
    cmpq $0,%rax
    jne  ret_val_not_zero_hw2
    jmp  ret_val_zero_hw2
    
    ret_val_not_zero_hw2:
    popq %rdi
    movq %rax,%rdi
    addq %rcx,112(%rsp)
    jmp end_hw2
    
    ret_val_zero_hw2:
    popq %rdi 
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    popq %r11
    popq %r10
    popq %r9
    popq %r8
    popq %rbp
    popq %rsi 
    popq %rdx
    popq %rcx
    popq %rbx
    popq %rax 
    jmp *old_ili_handler
    
    
    
    end_hw2:
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    popq %r11
    popq %r10
    popq %r9
    popq %r8
    popq %rbp
    popq %rsi 
    popq %rdx
    popq %rcx
    popq %rbx
    popq %rax        
    iretq
