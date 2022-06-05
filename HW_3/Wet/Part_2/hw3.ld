PHDRS
{
  text PT_LOAD FLAGS(7);
  data PT_LOAD FLAGS(7);
}

SECTIONS
{
  PROVIDE (__executable_start = SEGMENT_START("text-segment", 0x400000)); . = SEGMENT_START("text-segment", 0x400000) + SIZEOF_HEADERS;

  .text : { *(.text) } :text

  /* Adjust the address for the data segment.  We want to adjust up to
     the same address within the page on the next page up.  */
  . = DATA_SEGMENT_ALIGN (CONSTANT (MAXPAGESIZE), CONSTANT (COMMONPAGESIZE));

  .data : { *(.data) } :data
  .bss : { *(.bss) } :data

}
