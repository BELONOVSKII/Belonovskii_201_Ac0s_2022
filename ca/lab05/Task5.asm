.include "macrolib.s"
.data 
arr:

.text

read_int(t0) # N
la t1, arr
add t3, t1, zero #offset
add t5, t1, zero #endOfArray

loop:
beqz t0, end
addi t0, t0, -1
read_int(t2) # read integer
addi t3, t5, 0

checkTheExistance:
lw t4, 0(t3)
beq t4, t2, loop
beq t3, t1, endOfExistanceCheck
addi t3, t3, -4
j checkTheExistance

endOfExistanceCheck:
sw t2, 0(t5)
addi t5, t5, 4
j loop



end:
beq t1, t5, totalEnd
lw t4, 0(t1)
print_int(t4)
print_char('\n')
addi t1, t1, 4
j end

totalEnd:



