----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 02:11:32 PM
-- Design Name: 
-- Module Name: Mux_8way_4bit_Sim - Behavioral
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

entity Mux_8way_4bit_Sim is
--  Port ( );
end Mux_8way_4bit_Sim;

architecture Behavioral of Mux_8way_4bit_Sim is
    component Mux_8way_4bit is
        Port (  reg0 : in STD_LOGIC_VECTOR (3 downto 0);
                reg1 : in STD_LOGIC_VECTOR (3 downto 0);
                reg2 : in STD_LOGIC_VECTOR (3 downto 0);
                reg3 : in STD_LOGIC_VECTOR (3 downto 0);
                reg4 : in STD_LOGIC_VECTOR (3 downto 0);
                reg5 : in STD_LOGIC_VECTOR (3 downto 0);
                reg6 : in STD_LOGIC_VECTOR (3 downto 0);
                reg7 : in STD_LOGIC_VECTOR (3 downto 0);
                Reg_select : in STD_LOGIC_VECTOR (2 downto 0);
                output : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal reg0_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal reg1_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal reg2_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal reg3_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal reg4_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal reg5_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal reg6_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal reg7_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_select_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal output_tb : STD_LOGIC_VECTOR (3 downto 0);

begin
    uut: Mux_8way_4bit 
        port map (  reg0 => reg0_tb,
                    reg1 => reg1_tb,
                    reg2 => reg2_tb,
                    reg3 => reg3_tb,
                    reg4 => reg4_tb,
                    reg5 => reg5_tb,
                    reg6 => reg6_tb,
                    reg7 => reg7_tb,
                    Reg_select => Reg_select_tb,
                    output => output_tb);

    process
    begin
            reg0_tb <= "0000";
            reg1_tb <= "1111";
            reg2_tb <= "1010";
            reg3_tb <= "0101";
            reg4_tb <= "1100";
            reg5_tb <= "0011";
            reg6_tb <= "0110";
            reg7_tb <= "1001";

            Reg_select_tb <= "000";
            wait for 100 ns;
            
            Reg_select_tb <= "001";
            wait for 100 ns;
           
            Reg_select_tb <= "010";
            wait for 100 ns;
            
            Reg_select_tb <= "011";
            wait for 100 ns;
            
            Reg_select_tb <= "100";
            wait for 100 ns;
            
            Reg_select_tb <= "101";
            wait for 100 ns;
            
            Reg_select_tb <= "110";
            wait for 100 ns;
            
            Reg_select_tb <= "111";
            wait for 100 ns;
            
           
      end process;
end Behavioral;
