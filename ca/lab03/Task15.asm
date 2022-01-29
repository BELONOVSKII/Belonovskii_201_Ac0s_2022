# (x == (y + 3)) ? 0 : 1



# ReadInt x
li a7, 5 
ecall
add t0, a0, zero  # load input variable to t0

# ReadInt y
li a7, 5 
ecall
add t1, a0, zero # load input variable to t1

# t1 = y+3
addi t1, t1, 3

rem t2, t0, t1

addi t0, zero, 0

srli t2, t2, 1 

slt t3, t0, t2

li a7, 1
add a0, t3, zero
ecall
