# 2 * x * x - 3 * y + 4

# ReadInt x
li a7, 5 
ecall
add t0, a0, zero  # load input variable to t0

# ReadInt y
li a7, 5 
ecall
add t1, a0, zero # load input variable to t1

# t2 = x*x
mul t2, t0, t0

# t0 = 2*x*x
slli t0, t2, 1



# t2 = -3*y
addi t3, zero, -3
mul t2, t1, t3


#t1 = 2*x*x-3*y
add t1, t0, t2

# 2 * x * x - 3 * y + 4
li a7, 1
addi a0, t1, 4
ecall
