----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2023 03:12:16 AM
-- Design Name: 
-- Module Name: PC_3bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC_3bit is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           MemorySelect : inout STD_LOGIC_VECTOR (2 downto 0);
           JumpAddr : in STD_LOGIC_VECTOR (2 downto 0);                -- If there is a jump instruction, PC set MemorrySelect as the 
           JumpFlag : in STD_LOGIC
           ); 
end PC_3bit;

architecture Behavioral of PC_3bit is
    COMPONENT D_FF
    PORT (
        D : in STD_LOGIC;
        Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qbar : out STD_LOGIC );
    END COMPONENT;

    --COMPONENT Slow_Clk
    --PORT (
        --Clk_in : in STD_LOGIC;
        --Clk_out : out STD_LOGIC );
    --END COMPONENT;
    
    COMPONENT RCA_3
    PORT (
        B : in STD_LOGIC_VECTOR (2 downto 0);      -- Always this is equals to 001
        S : out STD_LOGIC_VECTOR (2 downto 0);     -- Next memory address will out
        C_out : out STD_LOGIC);
    END COMPONENT;
    
    COMPONENT Mux_2way_3bit
    PORT ( jmp_adrs : in STD_LOGIC_VECTOR (2 downto 0);
           adder_3bit : in STD_LOGIC_VECTOR (2 downto 0);
           jmp_flag : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (2 downto 0));
    END COMPONENT;    
    
    signal D, A: std_logic_vector (2 downto 0);
    --signal Clk_slow : std_logic;
    
    begin
    
        --Slow_Clk0 : Slow_Clk
            --port map (
                --Clk_in => Clk,
                --Clk_out => Clk_slow );
    
        D_FF0 : D_FF
            port map (
                D => D(0),
                Q => MemorySelect(0),
                Res => Reset,
                Clk => Clk);--Clk_slow );
        
        D_FF1 : D_FF
            port map (
                D => D(1),
                Q => MemorySelect(1),
                Res => Reset,
                Clk => Clk);--Clk_slow );               
                
        D_FF2 : D_FF
            port map (
                 D => D(2),
                 Q => MemorySelect(2),
                 Res => Reset,
                 Clk => Clk);--Clk_slow );    
                 
        RCA3 : RCA_3
            port map (
                 B => MemorySelect,
                 S => A );           
       
        Mux_2way_3bit0 : Mux_2way_3bit
            port map (
                 jmp_adrs => JumpAddr,
                 adder_3bit => A,
                 jmp_flag => JumpFlag,
                 output => D  );
        

    end Behavioral;
