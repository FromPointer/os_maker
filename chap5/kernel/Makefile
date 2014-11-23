all: os-image

os_image: boot_sect.bin kernel.bin
	cat $^ > os_image

run: all
	bochs

boot_sect.bin: boot_sect.asm
	nasm $< -f bin -I '../../16bit/' -o $@

# Disassemble our kernel - might be useful for debugging.
kernel.dis: kernel.bin
	ndisasm -b 32 $< > $@

# $^ is substituted with all of the target¡¯s dependancy files
kernel.bin: kernel_entry.o kernel.o
	ld -o kernel.bin -Ttext 0x1000 $^ --oformat binary

# $< is the first dependancy and $@ is the target file
kernel.o: kernel.c
	gcc -ffreestanding -c $< -o $@

# $< is the first dependancy and $@ is the target file
kernel_entry.o: kernel_entry.asm
	nasm $< -f elf -o $@

clean: 
	rm -rf *~ *o *dis *bin os_image* os-image*
