.include "macrolib.s"

.data
arr: 

.text
read_int(t0)
la t4, arr
addi t5, zero, 0

while:
beqz t0, end
addi t0, t0, -1
read_int(t1)
addi t3, zero, 2
rem t2, t1, t3
beqz t2, continue
j while

continue:
add t6, t4, t5
sw t1, 0(t6)
addi t5, t5, 4
j while

end:
lw t1, 0(t6)
print_int(t1)
print_char('\n')
beq t4, t6, totalEnd
addi t6, t6, -4
j end

totalEnd:
