# Makefile
all: piku
 
piku: piku.o
	gcc -o $@ $+
 
piku.o : piku.s
	as -o $@ $<
 
clean:
	rm -vf piku *.o