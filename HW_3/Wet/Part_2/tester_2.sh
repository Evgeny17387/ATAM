echo running[...]
as hw3_hook.asm -o hw3_hook.o
ld a_2.o a.o hw3_hook.o b.o -o hw3.out -T hw3.ld
./hw3.out > output/a_2_out.txt
ld b_2.o a.o hw3_hook.o b.o  -o hw3.out -T hw3.ld
./hw3.out > output/b_2_out.txt

diff -q expected.txt output/a_2_out.txt
diff -q expected.txt output/b_2_out.txt
echo done!
