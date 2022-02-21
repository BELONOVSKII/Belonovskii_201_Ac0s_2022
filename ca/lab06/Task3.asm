.include "macrolib.s"

j main

sort:
mv t0, s0
mv a4, s0
mv a5 ,s0
.data
arr:
.text
la a2, arr
addi a3, zero, 0 # offset

while:
beqz t0, end
read_int(a4)
sw a4, (a2)
addi a2,a2, 4
addi t0, t0, -1
j while

end:
la a4, arr
addi a3, zero, 0

addi t3, zero, 0

sortingAlgorithm:

forIinN:
lw t0, (a4)
la t1, arr
beqz a5, endI
addi a3, a3, 1
mv t3, a3

forJinI:
beqz t3, endJ
lw a6, (t1)
bgt a6, t0, changeVaribales
addi t3, t3, -1
addi t1, t1, 4
j forJinI

changeVaribales:
addi t2, t0, 0
addi t0, a6, 0
addi a6, t2, 0
sw a6, (t1)
sw t0, (a4)
addi t3, t3, -1
addi t1, t1, 4
j forJinI

endJ:
addi a5, a5, -1
addi a4, a4, 4
j forIinN

endI:
mv a1, a4
la a0, arr
jr ra




main:
read_int(s0)
jal sort
mv s0, a0
mv s1, a1
endMain:
beq s0, s1, totalEnd
lw t4, 0(s0)
print_int(t4)
print_char(' ')
addi s0, s0, 4
j endMain
totalEnd:



