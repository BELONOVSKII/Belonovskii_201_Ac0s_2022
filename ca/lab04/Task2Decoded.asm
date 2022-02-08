 
 
li a7, 5
ecall
mv t1, a0 # store "a"
srli t0, a0, 31 # sign of "a"

ecall
mv t4, a0 # store "b"
srli t3, a0, 31 # sign of "b"

beq t1, zero, l1
beq t4, zero, l1
beq t0, zero, l2   # if "a" < 0 then inverse it
xori t1, t1, -1
addi t1, t1, 1

l2: 
beq t3, zero,  l3  # if "b" < 0 then inverse it
xori t4, t4, -1
addi t4, t4, 1

l3: 
bge t1, t4, l4
xor t4, t4, t1
xor t1, t4, t1
xor t4, t4, t1

l4:
add t2, zero, zero

l5: 
add t2, t2, t1
addi t4, t4, -1
blt zero, t4, l5
xor  t6, t0, t3
beq t6, zero, l6
xori t2, t2,-1
addi t2, t2, 1

l6:
addi a7, zero, 1 
add a0, zero, t2
ecall
addi a7, zero, 10
ecall

l1:
addi a7, zero, 1
add a0,  zero, zero 
ecall 
addi a7, zero, 10 
ecall