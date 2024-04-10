CC = gcc
AS = nasm
LD = gcc

ASFLAGS = -f elf64
LDFLAGS =

SRC = bubble_sort.asm
OBJ = $(SRC:.asm=.o)
EXE = main

.PHONY: all clean

all: $(EXE)

$(EXE): $(OBJ)
    $(LD) $(LDFLAGS) -o $@ $^

%.o: %.asm
    $(AS) $(ASFLAGS) $< -o $@

clean:
    rm -f $(OBJ) $(EXE)
