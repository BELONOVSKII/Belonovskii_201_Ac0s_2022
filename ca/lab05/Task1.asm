.include "macrolib.s"
read_int(t0)
read_int(t1)
read_int(t2)
read_int(t3)
add t0, t0, t2
add t1, t1, t3
print_int(t0)
print_char('\n')
print_int(t1)