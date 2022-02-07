.data 
word:
.asciz "Hello, ACOS"

.text
li a7, 4
la a0, word
ecall