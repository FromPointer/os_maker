; Test file
; To test all function

[org 0x7c00]
	mov bp, 0x9000 
	mov sp, bp

; Test print_string function
mov ebx, HELLO_MSG
call print_string

; Test print_string_pm 
; Error usage
; Right usage: need to switch to protect mode
mov ebx, PM_HELLO_MSG
call print_string_pm


jmp $

; import or include file
%include "./print/print_string.asm"
%include "./print_string_pm.asm"

; Variable
HELLO_MSG:
    db "Hello, world", 0
PM_HELLO_MSG:
    db "In protect Mode, Hello world!", 0

times 510-($-$$) db 0
dw 0xaa55


