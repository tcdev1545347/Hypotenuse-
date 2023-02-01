//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
//Author name: Tien Cao
//Author email: tiencao@csu.fullerton.edu
//
//Program information
//  Program name: Tien Cao
//  Programming languages: One modules in C++ and one module in X86
//  Date program began: 2023 February 1
//  Date of last update: 2023 February 6
//
//  Files in this program: pythagoras.cpp, hypotenuse.asm
//
//This file
//   File name: pythagoras.cpp
//   Language: C++
//   Compile: g++ -c -m64 -Wall -no-pie -o pythagoras.o pythagoras.cpp -std=c++20
//   Link: g++ -m64 -no-pie -o final_hypotenuse.out hypotenuse.o pythagoras.o -std=c++20
//
//===== Begin code area ===========================================================================================================

#include <stdio.h>
#include <stdint.h>
#include <ctime>
#include <cstring>


extern "C" double pythagoras();

int main()
{
    double hypotenuse = 0.0;
    printf("Welcome to Pyhtagorass' Math Lab programmed by Tien Cao.\n");
    printf("Please contact me at tiencao@csu.fullerton.edu if you need assistance.\n");
    
    hypotenuse = pythagoras();

    printf("The main file received this number: %.12lf, and will keep it for now.\n", hypotenuse); 
    printf("We hoped you enjoyed your right angles.\n");
    printf("Have a good day. A 0 will be sent to your operating system.\n");
    return 0;
}

