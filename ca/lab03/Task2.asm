#x >> 2 + (y - 1) << 3 (>> - logical shift)
# as far as I understand, firstly we do add and substract operations and than shift ones
# ReadInt x
li a7, 5 
ecall
add t0, a0, zero  # load input variable to t0

# ReadInt y
li a7, 5 
ecall
add t1, a0, zero # load input variable to t1

# t1 = 2 + (y-1) = y+1
addi t1, t1, 1

# t0 = x >> t1
srl t0, t0, t1
#t0 = t0 << 3
slli t0, t0, 3


li a7, 1
add a0, t0, zero
ecall
