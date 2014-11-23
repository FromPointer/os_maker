; Test print_hex
mov dx, 0x1fb6 ; store the value to print in dx
call print_hex  ; call the function


; prints the value of DX as hex.
; TODO: manipulate chars at HEX_OUT to reflect DX
; Define function print_hex
print_hex:

mov bx, HEX_OUT   ; print the string pointed to 
call print_string ; by BX
ret


; global variables 
HEX_OUT: db ’0x0000’,0
