# (x + 5) - (y - 7)

# ReadInt x
li a7, 5 
ecall
add t0, a0, zero  # load input variable to t0

# ReadInt y
li a7, 5 
ecall
add t1, a0, zero # load input variable to t1

# t2 = -y 
NEG t2, t1
# t1 = x+5
addi t1, t0, 5
# t0 = x+5-y
add t0, t1, t2
# t2 = x+5-y+7
addi t2,t0,7

li a7, 1
add a0, t2, zero
ecall
