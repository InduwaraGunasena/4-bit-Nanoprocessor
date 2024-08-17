# Getting Started

All codes necessary to build the nanoprocessor are included in the **Lab 10.rcs** folder. It has several subfolders.

    Lab 10.srcs
    ├───constrs_1
    │   └───imports
    │       └───Downloads
    │               Basys3Labs.xdc       # Since I used Basys 3 board, it uses Basys 3 constraints file. 
    │
    ├───sim_1                            # All simulator code files I used are there. 
    │   └───new
    │           Add_Sub_Sim.vhd          # Simulator for 4-bit Add/Subtract unit.
    │           D_FF_Sim.vhd             # Simulator for D flip flops.
    │           Instruction_Dec_Sim.vhd  # Simulator for Instruction decoder unit.
    │           Mux_2way_3bit_Sim.vhd    # Simulator for 2 way 3 bit multiplexer.
    │           Mux_2_to_1_Sim.vhd       # Simulator for 2 way 1 bit multiplexer.
    │           Mux_8way_4bit_Sim.vhd    # Simulator for 8 way 4 bit multiplexer.
    │           Nanoprocessor_Sim.vhd    # Simulator for whole nanoprocessor.
    │           PC_3bit_Sim.vhd          # Simulator for 3 bit program counter.
    │           Program_ROM_Sim.vhd      # Simulator for program ROM.
    │           RCA_3_Sim.vhd            # Simulator for 3 bit ripple carry adder.
    │           Register_Bank_Sim.vhd    # Simulator for register bank.
    │
    └───sources_1
        ├───imports                      # I build those things separately. So I imported those to build the nanoprocessor and integrated them.
        │   └───new
        │           Counter.vhd          # counter circuit.
        │           Decoder_2_to_4.vhd   # 2x4 decoder circuit.
        │           Decoder_3_to_8.vhd   # 3x8 decoder circuit.
        │           D_FF.vhd             # D flip flop circuit.
        │           FA.vhd               # Full adder circuit.
        │           HA.vhd               # Half adder circuit.
        │           LUT_16_7.vhd         # Look-up table(ROM based) for a 7 segment display.
        │           Mux_8_to_1.vhd       # 8x1 Multiplexer circuit.
        │           RCA_4.vhd            # 4 bit Ripple carry adder circuit.
        │           Reg.vhd              # Since I used Basys 3 board, it uses Basys 3 constraints file.
        │           Slow_Clk.vhd         # This is used to slow down the clock rate.
        │
        └───new
                2way_3bit_Mux.vhd        # 2 way 3 bit multiplexer circuit.
                Add_Sub_4bit.vhd         # 4-bit Add/Subtract circuit.
                D_FlipFlop.vhd           # D flip flop circuit.
                Instruction_Dec.vhd      # Instruction decoder circuit.
                Mux_2way_3bit.vhd        # 2 way 3 bit multiplexer circuit.
                Mux_2way_4bit.vhd        # 2 way 4 bit multiplexer circuit.
                Mux_2_to_1.vhd           # Simple multiplexer circuit.
                Mux_8way_4bit.vhd        # 8 way 4 bit multiplexer circuit.
                Nanoprocessor.vhd        # Nanoprocessor circuit.
                PC_3bit.vhd              # 3 bit program counter circuit.
                Program_ROM.vhd          # Program ROM circuit.
                RCA_3.vhd                # 3 bit ripple carry adder circuit.
                Register_Bank.vhd        # Register bank circuit.
