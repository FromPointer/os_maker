CSOURCE = $(wildcard kernel/*.c drivers/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h)
OBJ     = ${CSOURCE:.c=.o}

all: os-image

run: all
	bochs


os-image: boot/boot_sect.bin kernel.bin
	cat $^ > os-image


kernel.bin: kernel/kernel_entry.o ${OBJ}
	ld -o $@ -Ttext 0x1000 $^ --oformat binary


# Generic rule for compiling C code to an object file
# For simplicity, we C files depend on all header files.
%.o: %.c ${HEADERS}
	gcc --ffreestanding -c $< -o $@

###################################################
# The above code is equvalent to the following codes
#
# kernel/kernel.o : kernel/kernel.c
#	gcc -ffreestanding -c $< -o $@
# drivers/screen.o : drivers/screen.c 
# 	gcc -ffreestanding -c $< -o $@
# drivers/keyboard.o : drivers/keyboard.c 
# 	gcc -ffreestanding -c $< -o $@
####################################################

# Assemble the kernel_entry.
%.o: %.asm
	nasm $< -f bin -I '../../16bit/' -o $@

%.bin: %.asm
	nasm $< -f bin -I '../../16bit/' -o $@

clean:
	rm -rf *.bin *.dis *.o os_image os-imaeg
	find . -name "*.o" | awk '{print $0}' | xargs rm -rf
	find . -name "*.bin" | awk '{print $0}' | xargs rm -rf
	find . -name "*.dis" | awk '{print $0}' | xargs rm -rf

