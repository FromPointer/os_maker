; load DH sectors to ES:BX from drive DL
; Store DX on stack so later we can recall 
; how many sectors were request to be read,
; even if it is altered in the meantime

disk_load:
push dx
mov ah, 0x20
mov al, dh
mov ch, 0x00   ; Select cylinder 0
mov dh, 0x00   ; Select head 0
mov cl, 0x02   ; Start reading from second sector


int 0x13       ; BIOS interrupt

jc disk_error  ; Jump if error

pop dx         ; Restore DX from the stack

cmp dh, al     ; if AL (sectors read) != DH (sectors expected)

jne disk_error ; display error message

ret


disk_error :

mov bx, DISK_ERROR_MSG

call print_string

jmp $


; Variables
DISK_ERROR_MSG db "Disk read error!", 0
