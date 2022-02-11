.include "macrolib.s"
read_int(t0)
mv t1, t0
addi t2, zero, 10
# firstly let's determine N
while:
beqz t1, end
div t1, t1, t2
addi t3, t3, 1 #N
j while
end: 
addi t5, zero, 10

addi t4, t4, 0
while1:
beqz t3, end1
rem t2, t0, t5
add t4, t4, t2
div t0, t0, t5
addi t3, t3, -1
j while1

end1:
blez t4, outNeg
j totalEnd
outNeg:
addi t5, zero, -1
mul t4, t4, t5
totalEnd:
print_int(t4)
