.include "macrolib.s"

j ASCIIGrid
.macro printline(%x, %y, %z)
mv t0, %x
li t1, 1
li t2, -1
for:
beq t1, t2, printZ 
printY:
print_char(%y)
mul t1, t1, t2
j for
printZ:
beqz t0, end
print_char(%z)
mul t1, t1, t2
addi t0,t0, -1
j for
end:
.end_macro 

.macro print_line2(%x, %y)
mv t0, %x

for:
print_str("| ")
beqz t0, end
addi t0, t0, -1
j for
end:
.end_macro 

ASCIIGrid:
read_int(s0)
read_int(s1)
for:
printline(s0, '+', '-')
newline
beqz s1, end
print_line2(s0, '|')
newline
addi s1, s1, -1
j for
end:





