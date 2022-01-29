# x << y - 10

# ReadInt x
li a7, 5 
ecall
add t0, a0, zero  # load input variable to t0

# ReadInt y
li a7, 5 
ecall
add t1, a0, zero # load input variable to t1

#t1 =  y - 10
addi t1, t1, -10

# t0 = t0 << t1
sll t0, t0, t1

li a7, 1
addi a0, t0, 0
ecall

