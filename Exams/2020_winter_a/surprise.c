int foo(int* arr, int k);

char* s = "I will survive\n";

int _start()
{
    asm("movq $1, %%rax;"
    "movq $1, %%rdi;"
    "movq %0, %%rsi;"
    "movq $15, %%rdx;"
    "syscall": : "r"(s) : "rax", "rdi", "rsi", "rdx", "memory");

    int arr[] = {6, 3, 9};
    int k = 3;

    foo(arr, k);

    asm("movq $60, %%rax;"
    "movq $0, %%rdi;"
    "syscall": : : "rax", "rdi");
}
