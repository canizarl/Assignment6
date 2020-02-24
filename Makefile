# Makefile for simple_mc.c
# compiler variables
CC = gcc
CFLAGS = -Wall -g

# custom variables
objects = simple_mc.o

simple_mc: $(objects)
	$(CC) $(CFLAGS) -o simple_mc $(objects)

simple_mc.o: simple_mc.c 
	$(CC) $(CFLAGS) -c simple_mc.c


.PHONY: 
clean:
	$(RM) simple_mc $(objects)
	