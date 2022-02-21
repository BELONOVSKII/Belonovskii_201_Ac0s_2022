.include "macrolib.s"

j main

comparisingOne:
bge a1, a0, label1
addi a0, zero, 0
jr t5
label1:
addi a0, zero, 1
jr t5

comparisingTwo:
addi t2, zero, 10
rem a0, a0, t2
rem a1, a1, t2
bge a0, a1, label21
addi a0, zero, 0
jr t5
label21:
addi a0, zero, 1
jr t5







sort:
mv t0, s0
mv t6, s1
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
mv a0, a6
mv a1, t0
beqz t6, sort1
j sort2
sort1:
jal t5, comparisingOne
j continue
sort2:
jal t5, comparisingTwo
continue:
beqz a0, changeVaribales
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
mv a0, s0
la a1, arr
jr ra




main:
read_int(s0)
read_int(s1)
jal sort
mv s0, a0
mv s1, a1
endMain:
beqz s0, totalEnd
lw t4, 0(s1)
print_int(t4)
print_char('\n')
addi s0, s0, -1
addi s1, s1, 4
j endMain
totalEnd: