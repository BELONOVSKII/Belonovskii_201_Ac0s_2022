#
# Example that demonstrates MMIO in Bitmap Display.
#
    .eqv   ALLSIZE 0x20000      # videomemory size (in words)
    .eqv   BASE    0x10010000   # MMIO base
    .eqv   START 15996 # the point at which we start drawing (128*31 + 31)*4
    .text
    
    li a7, 5
    ecall #a0 - input color
    
    li s0, BASE
    li t1, START
    add s1, s0, t1
    li t2, 0
    li t3, 0
    addi s2, zero, 256
    addi s3, zero, 64
    addi t4, zero, 0 #counter
draw_upper_part:
    add t2, s1, t3
    sw   a0, 0(t2)
    addi t3, t3, 4
    beq t3, s2, draw_right_part
    j    draw_upper_part
draw_right_part:
    addi t2, t2, 512
    sw   a0, 0(t2)
    addi t4, t4, 1
    beq t4, s3, draw_right_part_end 
    j    draw_right_part
draw_right_part_end:
addi t4, zero, 0
draw_bottom_part:
    addi t2, t2, -4
    sw   a0, 0(t2)
    addi t4, t4, 1
    beq t4, s3, draw_bottom_part_end
    j    draw_bottom_part
 draw_bottom_part_end:
 addi t4, zero, 0
 draw_left_part:
    addi t2, t2, -512
    sw   a0, 0(t2)
    addi t4, t4, 1
    beq t4, s3, draw_left_part_end 
    j     draw_left_part
    
draw_left_part_end:
