# x < -5 & y > 10
# ReadInt x
li a7, 5 
ecall
add t0, a0, zero  # load input variable to t0

# ReadInt y
li a7, 5 
ecall
add t1, a0, zero # load input variable to t1

slti t0, t0, -5
addi  t2, zero, 10
slt t1, t2, t1

and t0, t0, t1

li a7, 1
add a0, t0, zero
ecall