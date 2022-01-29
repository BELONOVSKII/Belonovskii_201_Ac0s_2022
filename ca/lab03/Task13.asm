# reset the y-th bit of x to 0
# ReadInt x
li a7, 5 
ecall
add t0, a0, zero  # load input variable to t0

# ReadInt y
li a7, 5 
ecall
add t1, a0, zero # load input variable to t1

#  shift 1 (y-1)-times left and using negate it bitwise
addi t2, zero, 1
addi t4, t1, -1
sll t3, t2, t4
not t1, t3

# logical and with x
and t2, t1, t0

li a7, 1
add a0, t2, zero
ecall