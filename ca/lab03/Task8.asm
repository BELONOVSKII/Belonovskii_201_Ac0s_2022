#(x + 5) / y + 10 / (y - 1)
# ReadInt x
li a7, 5 
ecall
add t0, a0, zero  # load input variable to t0

# ReadInt y
li a7, 5 
ecall
add t1, a0, zero # load input variable to t1

# t2 = x+5
addi t2, t0, 5

#t0 = x+5/y
div t0,t2,t1

addi t2, zero, 10

#t1 = 10/(y-1)
addi t3, t1, -1
div t1, t2, t3

li a7, 1
add a0, t0, t1
ecall
