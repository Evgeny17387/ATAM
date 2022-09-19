#include <asm/desc.h>

void my_store_idt(struct desc_ptr *idtr) {
// <STUDENT FILL> - HINT: USE INLINE ASSEMBLY
// SAVE OLD idtr REG
//NEED SIDT,
asm volatile("SIDT %0;"
	      :"=m"(*idtr)
	      :
	      );

// </STUDENT FILL>
}

void my_load_idt(struct desc_ptr *idtr) {
// <STUDENT FILL> - HINT: USE INLINE ASSEMBLY
//SIDT
asm volatile("LIDT %0;"
	      :
	      :"m"(*idtr)
	      );
// <STUDENT FILL>
}

void my_set_gate_offset(gate_desc *gate, unsigned long addr) {
// <STUDENT FILL> - HINT: NO NEED FOR INLINE ASSEMBLY

    gate->offset_low = addr & 0xffff;
    gate->offset_middle = (addr & 0xffff0000) >> 16;
    gate->offset_high = (addr & 0xffffffff00000000) >> 32;

// </STUDENT FILL>
}

unsigned long my_get_gate_offset(gate_desc *gate)
{
// <STUDENT FILL> - HINT: NO NEED FOR INLINE ASSEMBLY
// return extracted address handler
unsigned long ret_offset = 0;
ret_offset += (unsigned long) (gate->offset_high);
ret_offset = ret_offset << 32;
ret_offset += ((unsigned long) (gate->offset_middle)) << 16;
ret_offset += (unsigned long) (gate->offset_low);
return ret_offset;


// </STUDENT FILL>
}
