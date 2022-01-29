# x * 6 - y * 3 

# ReadInt x
li a7, 5 
ecall
add t0, a0, zero  # load input variable to t0

# ReadInt y
li a7, 5 
ecall
add t1, a0, zero # load input variable to t1

# x*6 <=> (x*2) + (x*2) + (x*2)       x*2 == x << 1
slli t4, t0, 1
add t2,t4,t4
add t0, t2, t4

# y*3 <=> y + y + y
add t2, t1, t1
add t3, t2, t1
NEG t1, t3

li a7, 1
add a0, t1, t0
ecall