build: 
	gcc -m32 -c p9c.c
	nasm -f elf p9.asm
	gcc -m32 p9c.o p9.o -L ../../lib -lpc_io -no-pie -z noexecstack -o ../../bin/practica9.exe
run:
	./../../bin/practica9.exe
