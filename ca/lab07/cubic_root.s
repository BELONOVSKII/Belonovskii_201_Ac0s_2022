.include "macrolib.s"
read_double(fs0) # A 
read_double(fs1)

addi t0, zero, 2
fcvt.d.w ft0, t0
addi t0, zero, 0
fcvt.d.w ft7, t0 #lower bound
fmv.d ft6, fs0 #upper bound


while:
fadd.d ft4, ft6, ft7 
fdiv.d ft4, ft4, ft0 # k
fmul.d ft1, ft4, ft4
fmul.d ft1, ft1, ft4 # K^3
fabs.d ft1, ft1 # |k^3|
fabs.d ft2, fs0 # |A|
fsub.d ft3, ft2, ft1
fabs.d ft3, ft3
fle.d t1, ft3, fs1
bgtz t1, totalEnd
fge.d t1, ft1, ft2
bgtz t1,greater
fle.d t1, ft1, ft2
bgtz  t1,less
less:
fmv.d ft7, ft4
j while
greater:
fmv.d ft6, ft4
j while
totalEnd:
print_double(ft4)

