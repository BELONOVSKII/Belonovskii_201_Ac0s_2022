#(x / y) * y + x % y
# ReadInt x
li a7, 5 
ecall
add t0, a0, zero  # load input variable to t0

# ReadInt y
li a7, 5 
ecall
add t1, a0, zero # load input variable to t1

# t2 = (x/y)
div t2, t0, t1

# t3 = (x/y)*y
mul t3, t2, t1

#t4 = x%y
rem t4, t0, t1

li a7, 1
add a0, t3, t4
ecall
