# 4-bit-Nanoprocessor
This is a team project completed during the second semester at my university. In this lab, we designed a 4-bit processor capable of executing four instructions. We used the **Digilent Basys 3 Artix-7** FPGA Trainer Board to implement this nanoprocessor.

<p align="center">
<img src="/images/Basys3.jpg" alt="Basys 3 Artix-7 FPGA Trainer Board" width="500"/>
</p>

We used **Vivado** software to program this board. You can watch [this video](https://www.youtube.com/watch?app=desktop&v=6_GxkslqbcU) for guidance on setting up the software and gaining a basic understanding of it.

## Introduction
We designed a very simple microprocessor capable of executing a small set of instructions. Due to its simplicity, we refer to it as a nanoprocessor. The following diagram shows a high-level block diagram of this nanoprocessor:

<p align="center">
<img src="/images/1.png" alt="High-level diagram of the nanoprocessor." width="500"/>
</p>

This processor includes various basic components such as the ALU, program counter, instruction decoder, and more. We built this circuit using the following components/modules:
  - **4-bit Add/Subtract unit** : This unit can add and subtract numbers represented in 2’s complement form.
  - **3-bit adder** : This unit increments the Program Counter.
  - **3-bit Program Counter (PC)** : A 3-bit Program Counter implemented using D Flip-Flops with a clear/reset input.
  - **k-way b-bit multiplexers** : A k-way b-bit multiplexer can take in k inputs, each with b bits, and output a group of b bits. We built a 2-way 3-bit multiplexer, a 2-way 4-bit multiplexer, and an 8-way 4-bit multiplexer.
  - **Register Bank** : This bank contains eight 4-bit registers (R0 to R7) with R0 hardcoded to 0s. As there is no separate instruction to reset a register, we used D Flip-Flops with a reset input connected to the Reset button. This button is also connected to the Program Counter's Reset input (not shown in Fig. 1 for simplicity).
  - **Program ROM** : Stores the Assembly program. 
  - **Buses** : We used 3-bit, 4-bit, and 12-bit buses to connect components.
  - **Instruction Decoder** : Activates necessary components based on the instructions being executed. We carefully activated only the required modules for each instruction, such as enabling specific registers, selecting inputs from multiplexers, and setting appropriate flags.

All the code for designing these components/modules is located in the **src/Lab 10.srcs** folder.

The set of instructions supported by the nanoprocessor is provided in the following table:

| Instruction | Description | Format (12-bit instruction) |
| --- | --- | --- |
| **MOVI** R, d  | Move immediate value d to register R <br>i.e., R ← d, R ∈ [0, 7], d ∈ [0, 15]  | 1 0 R R R 0 0 0 d d d d |
| **ADD** Ra, Rb  | Add values in registers Ra and Rb and store the result in Ra, <br>i.e., Ra ←  Ra + Rb and Ra, Rb ∈ [0, 7]  | 0 0 Ra Ra Ra Rb Rb Rb 0 0 0 0 |
| **NEG** R  | 2’s complement of registers R, <br>i.e., R ← – R and R ∈ [0, 7]  | 0 1 R R R 0 0 0 0 0 0 0 |
| **JZR** R, d  | Jump if value in register R is 0, <br>i.e.,   If R == 0 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PC ← d; <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Else <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PC ← PC + 1;  <br>R ∈ [0, 7], d ∈ [0, 7] | 1 1 R R R 0 0 0 0 d d d |

## Sample programs
We tested two simple programs using this nanoprocessor:

### **1. Start from 10 and decrement to 0, one by one**
The following table represents the assembly program, its machine code representation, and a brief description:
| Instruction | Description | Machine Code (12-bit instruction) |
| --- | --- | --- |
| MOVI  R7, 0;  | R7 ← 10   | 10 111 000 1010  |
| MOVI  R2, 1;  | R2 ← 1   | 10 010 000 0001  |
| NEG  R2;  | R2 ← -R2   | 01 010 000 0000  |
| ADD  R7, R2;  | R7 ← R7 + R2   | 00 111 010 0000  |
| JZR  R7, 7;  | If R7 = 0 jump to line 4 again ant stop executing programme   | 11 111 000 0100  |
| JZR  R0, 3;  | If R0 = 0 jump to line 3   | 11 000 000 0011  |

Watch [this short video]() to see how it works.

### **2. Sum all integers between 1 and 3**
The following table represents the assembly program, its machine code representation, and a brief description:
| Instruction | Description | Machine Code (12-bit instruction) |
| --- | --- | --- |
| MOVI  R7, 10;  | R7 ← 0   | 10 111 000 0000  |
| MOVI  R1, 1;   | R1 ← 1    | 10 001 000 0001   |
| MOVI  R2, 2;  |  R2 ← 2    | 10 010 000 0010  |
| MOVI  R3, 3;  | R3 ← 3   | 10 110 000 0011   |
| ADD  R7, R1;    |  R7 ← R7 + R1    |  00 111 001 0000   |
| ADD  R7, R2;   | R7 ← R7 + R2    | 00 111 010 0000  |
| ADD  R7, R3;     | R7 ← R7 + R3   | 00 111 011 0000   |
| JZR  R0, 0;   | If R0 = 0 jump to line 6    | 11 000 000 0111  |

Watch [this short video]() to see how it works.

## Message from the developer
I welcome contributions to this project. Feel free to fork the repository, add improvements, and fix bugs. However, **please ensure proper credit is given to the author**:grin:.

Thank you :heart:
