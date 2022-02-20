.include "macrolib.s"


addi s3, zero, 1
addi s4, zero, 2
while:
read_int(s0)
read_int(s1)
read_int(s2)
jal CheckTriangles
beqz a0, endOfProgramm
beq a0, s3, Y
beq a0, s4, N

Y:
print_str("Y\n")
j while

N:
print_str("N\n")
j while





CheckTriangles:
mv a0, s0
mv a1, s1
mv a2, s2
bnez  a0, start
bnez  a1, start
bnez a2, start
addi a0, zero, 0
jr ra
start:
add a3, a0, a1
add a4, a1, a2
add a5, a2, a0
bgt a0, a4, end
bgt a1, a5, end
bgt a2, a3, end
addi a0, zero, 1
jr ra
end:
addi a0, zero, 2
jr ra


endOfProgramm:



