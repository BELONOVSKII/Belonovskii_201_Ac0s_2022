.include "macrolib.s"
read_int(t0)
addi t2, zero, 1
add t3, t3, zero
addi t4, t4, -1
while:
beqz t0, end
read_int(t1)
mul t1, t1, t2
mul t2, t2, t4
add t3, t3, t1
addi t0, t0, -1
j while
end:
print_int(t3)
