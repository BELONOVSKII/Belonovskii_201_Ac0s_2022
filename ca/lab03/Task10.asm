# x & (-1 << 5)
# ReadInt x
li a7, 5 
ecall
add t0, a0, zero  # load input variable to t0


# t1 = -1 << 5
addi t2, zero, -1
slli t1, t2, 5

#t2 =  x & (-1 << 5)
and t2, t0, t1

li a7, 1
add a0, t2, zero
ecall

