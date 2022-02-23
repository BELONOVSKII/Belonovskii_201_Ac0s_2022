.include "macrolib.s"
.text
read_double(fs0) # A
read_double(fs1) # B
read_int(s0) # n
fdiv.d fa0, fs0, fs1
mv a0, s0
jal round
print_double(fa0)
j totalEnd

round:
addi a1, zero, 1
addi t0, zero, 10
fcvt.d.w ft0, t0
fcvt.d.w fa1, t0
for:
beq a1, a0, end
addi a1, a1, 1
fmul.d fa1, fa1, ft0
j for
end:
fmul.d fa0, fa0, fa1
fcvt.w.d t0, fa0
fcvt.d.w fa0, t0
fdiv.d fa0, fa0, fa1
jr ra

totalEnd:



