# set the y-th bit of x to 1
# ReadInt x
li a7, 5 
ecall
add t0, a0, zero  # load input variable to t0

# ReadInt y
li a7, 5 
ecall
add t1, a0, zero # load input variable to t1

#  shift 1 y-times left
addi t2, zero, 1
addi t4, t1, -1
sll t3, t2, t4

# logical or with x
or t2, t3, t0

li a7, 1
add a0, t2, zero
ecall
