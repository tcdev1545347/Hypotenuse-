;****************************************************************************************************************************
;   Program name: "Hypotenuse".  This program takes in the user input for 2 sides in float                                     
;   calculates the hypotenuse. Copyright (C) 2021 Tien Cao.                                                                    
;                                                                                                                           
;   This file is part of the software program "Hypotenuse".                                                                    
;   Hypotenuse is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License    
;   version 3 as published by the Free Software Foundation.                                                                    
;   Hypotenuse is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied           
;   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     
;   A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.   
;                         *
;****************************************************************************************************************************

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: Tien Cao
;  Author email: tiencao@csu.fullerton.edu
;
;Program information
;  Program name: Hypotenuse
;  Programming languages: One modules in C++, one module in X86, and one module in Bash.
;  Date program began: 2023 February 1
;  Date of last update: 2023 February 6
;  Files in this program: pythagoras.cpp, hypotenuse.asm
;  Status: This program has been tested by the author
;This file
;   File name: hypotenuse.asm
;   Language: X86 with Intel syntax.
;   Assemble: nasm -f elf64 -l hypotenuse.lis -o hypotenuse.o hypotenuse.asm
;   Purpose: Calculating the hypotenuse of a triangle using float inputs. And output floats in assembly
;   Limitations: Input validation 

;===== Begin code area ================================================================================================

extern printf
extern scanf
global pythagoras

segment .data
    welcome db "Welcome to Hypotenuse.", 10, 0
    prompt1 db "Enter the value of the first side: ", 0
    prompt2 db "Enter the value of the second side: ", 0
    
    double_form db "%lf", 0

    response db "You entered %.6lf  and %.6lf", 10, 0 

    output_hypotenuse db "The length of the Hypotenuse is %.6lf.", 10, 0


segment .bss
;Empty

segment .text

pythagoras:
;=========== Back up all the integer registers used in this program =======================================================
;Omitted from back up are rax, rip.
push       rbp                                    ;Save a copy of the stack base pointer
mov        rbp, rsp                               ;We do this in order to be 100% compatible with C and C++.
push       rbx                                    ;Back up rbx
push       rcx                                    ;Back up rcx
push       rdx                                    ;Back up rdx
push       rsi                                    ;Back up rsi
push       rdi                                    ;Back up rdi
push       r8                                     ;Back up r8
push       r9                                     ;Back up r9
push       r10                                    ;Back up r10
push       r11                                    ;Back up r11
push       r12                                    ;Back up r12
push       r13                                    ;Back up r13
push       r14                                    ;Back up r14
push       r15                                    ;Back up r15
pushf                                             ;Back up rflags

push qword 0

; Display welcome message
push qword 0
mov rax, 0
mov rdi, welcome
call printf
pop rax

; Prompt user for input
push qword 0
mov rax, 0
mov rdi, prompt1
call printf
pop rax

; Begin the scanf block
push qword 0
mov rax, 1
mov rdi, double_form
mov rsi, rsp
call scanf
movsd xmm10, [rsp]
pop rax 

; Prompt user for input
push qword 0
mov rax, 0
mov rdi, prompt2
call printf
pop rax

; Begin the scanf block
push qword 0
mov rax, 1
mov rdi, double_form
mov rsi, rsp
call scanf
movsd xmm11, [rsp]
pop rax

; Display recent input
push qword 0
mov rax, 2
mov rdi, response
movsd xmm0, xmm10
movsd xmm1, xmm11
call printf
pop rax

;======= Calculate Hypotenuse ======
movsd xmm12, xmm10      ;Preserving side 1
movsd xmm13, xmm11      ;Preserving side 2
mulsd xmm12, xmm12
mulsd xmm13, xmm13
addsd xmm12, xmm13
sqrtsd xmm12, xmm12

push qword 0
mov rax, 1
movsd xmm0, xmm12
mov rdi, output_hypotenuse
call printf
pop rax

pop rax

movsd xmm0, xmm12

;=========== Now cleanup and return to the caller =========================================================================

popf                                              ;Restore rflags
pop        r15                                    ;Restore r15
pop        r14                                    ;Restore r14
pop        r13                                    ;Restore r13
pop        r12                                    ;Restore r12
pop        r11                                    ;Restore r11
pop        r10                                    ;Restore r10
pop        r9                                     ;Restore r9
pop        r8                                     ;Restore r8
pop        rdi                                    ;Restore rdi
pop        rsi                                    ;Restore rsi
pop        rdx                                    ;Restore rdx
pop        rcx                                    ;Restore rcx
pop        rbx                                    ;Restore rbx
pop        rbp                                    ;Restore rbp

ret
