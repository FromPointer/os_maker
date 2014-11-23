; Ensures that we jump straight into the kernel
; entry function
[bits 32]
[extern main] ; Declare that we will be referencing the external symbol 'main'

call main ; invoke main() in our C kernel

jmp $

