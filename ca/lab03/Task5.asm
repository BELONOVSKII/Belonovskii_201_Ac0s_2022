# (x << 2 - y + 5) >> 1 (>> - arithmetical shift)

# ReadInt x
li a7, 5 
ecall
add t0, a0, zero  # load input variable to t0

# ReadInt y
li a7, 5 
ecall
add t1, a0, zero # load input variable to t1

# t1 = 7-y
NEG t1, t1
addi t1, t1, 7
# t0 = t0 << t1
sll t0, t0, t1 
#t0 = t0 >> 1
srai t0,t0,1


li a7, 1
add a0, t0, zero
ecall
