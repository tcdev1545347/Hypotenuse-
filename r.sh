#!/bin/bash

#Program: Hypotenuse
#Author: Tien Cao

#Clear any previously compiled outputs
rm *.o
rm *.out

echo "Assemble hypotenuse.asm"
nasm -f elf64 -l hypotenuse.lis -o hypotenuse.o hypotenuse.asm

echo "Compile pythagoras.cpp using g++ std 2020"
g++ -c -m64 -Wall -no-pie -o pythagoras.o pythagoras.cpp -std=c++20

echo "Link object files using the g++ Linker standard 2020"
g++ -m64 -no-pie -o final_hypotenuse.out hypotenuse.o pythagoras.o -std=c++20

echo "Run the Hypotenuse Program"
./final_hypotenuse.out
# For cleaner working directory, you can:
# rm *.lis
# rm *.o
# rm *.out

echo "Script file terminated."