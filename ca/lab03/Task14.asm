# x > y ? 0 : 1
# ReadInt x
li a7, 5 
ecall
add t0, a0, zero  # load input variable to t0

# ReadInt y
li a7, 5 
ecall
add t1, a0, zero # load input variable to t1


slt t2, t1,t0

xori t0, t2, 1

li a7, 1
add a0, t0, zero
ecall
