;
; A simple boot sector that prints a message to the screen using a BIOS routine. 
;

; int 10/ah = 0eh -> scrolling teletype BIOS routine
mov ah, 0x0e 

mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10

; Jump to the current address (i.e. forever).
jmp $


;
; Padding and magic BIOS number. 
;

; Pad the boot sector out with zeros
times 510-($-$$) db 0 

; Last two bytes form the magic number,
; so BIOS knows we are a boot sector.
dw 0xaa55 


