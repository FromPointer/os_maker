; A boot sector that boots a C kernel in 32bit protedted mode

[org 0x7c00]
; constants
KERNEL_OFFSET equ 0x1000 ; This is the memory offset to which we will load our kernel

	; BIOS stores our boot drive in DL, 
	; so it’s best to remember this for later.
	mov [BOOT_DRIVE], dl

	mov bp, 0x9000  ; Set-up the stack.
	mov sp, bp   

	; Announce that we are starting booting from 16-bit real mode
	mov bx, MSG_REAL_MODE
	call print_string

	call load_kernel ; Load our kernel
	
	; Switch to protected mode, from which we will not return
	call switch_to_pm

	jmp $

	; Include our useful, hard-earned routines 
	%include "print/print_string.asm"
	%include "disk/disk_load.asm"
	%include "pm/gdt.asm"
	%include "pm/print_string_pm.asm" 
	%include "pm/switch_to_pm.asm"

[bits 16]

; load_kernel
load_kernel:
	; Print a message to say we are loading the kernel
	mov bx, MSG_LOAD_KERNEL 
	call print_string

	mov bx, KERNEL_OFFSET 
	mov dh , 15
	mov dl, [BOOT_DRIVE] 
	call disk_load

	ret

[bits 32]

BEGIN_PM:
	; Use our 32-bit print routine to announce we are in protected mode
	mov ebx, MSG_PROT_MODE
	call print_string_pm 
	
	; Now jump to the address of our loaded
	; kernel code, assume the brace position, 
	; and cross your fingers. Here we go!
	call KERNEL_OFFSET

	jmp $            ; Hang.


; Global variables
BOOT_DRIVE        db 0
MSG_REAL_MODE 	  db "Started in 16-bit Real Mode", 0
MSG_PROT_MODE 	  db "Successfully landed in 32-bit Protected Mode", 0
MSG_LOAD_KERNEL	  db "Loading kernel into memory.", 0

; Bootsector padding 
times 510-($-$$) db 0 
dw 0xaa55
	




