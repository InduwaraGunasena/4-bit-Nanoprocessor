----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 10:54:56 AM
-- Design Name: 
-- Module Name: Mux_2way_3bit_Sim - Behavioral
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

entity Mux_2way_3bit_Sim is
--  Port ( );
end Mux_2way_3bit_Sim;

architecture Behavioral of Mux_2way_3bit_Sim is
    component Mux_2_to_1 is
        Port ( D : in STD_LOGIC_VECTOR (1 downto 0);
               S : in STD_LOGIC;
               Y : out STD_LOGIC);
    end component;
    
    component Mux_2way_3bit is
            Port ( 
               jmp_adrs : in STD_LOGIC_VECTOR (2 downto 0);
               adder_3bit : in STD_LOGIC_VECTOR (2 downto 0);
               jmp_flag : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (2 downto 0));
        end component;

    -- Signals for the testbench
    signal jmp_adrs_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal adder_3bit_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal jmp_flag_tb : STD_LOGIC;
    signal output_tb : STD_LOGIC_VECTOR (2 downto 0);

begin
    uut: Mux_2way_3bit
        port map (jmp_adrs => jmp_adrs_tb, adder_3bit => adder_3bit_tb, jmp_flag => jmp_flag_tb, output => output_tb);

    -- Stimulus process
    stimulus: process
    begin
    -- Test case 1 ( activating jump_address pin)
        jmp_adrs_tb <= "000";
        adder_3bit_tb <= "001";
        jmp_flag_tb <= '0';
        wait for 100 ns;
        
        jmp_adrs_tb <= "011";
        adder_3bit_tb <= "110";
        jmp_flag_tb <= '0';
        wait for 100 ns;
        
        jmp_adrs_tb <= "010";
        adder_3bit_tb <= "100";
        jmp_flag_tb <= '0';
        wait for 100 ns;
        
        jmp_adrs_tb <= "111";
        adder_3bit_tb <= "101";
        jmp_flag_tb <= '0';
        wait for 100 ns;
        
  -- Test case 2 ( activating 3bit adder pin)
        jmp_adrs_tb <= "000";
        adder_3bit_tb <= "001";
        jmp_flag_tb <= '1';
        wait for 100 ns;
        
        jmp_adrs_tb <= "011";
        adder_3bit_tb <= "110";
        jmp_flag_tb <= '1';
        wait for 100 ns;
        
        jmp_adrs_tb <= "010";
        adder_3bit_tb <= "100";
        jmp_flag_tb <= '1';
        wait for 100 ns;
        
        jmp_adrs_tb <= "111";
        adder_3bit_tb <= "101";
        jmp_flag_tb <= '1';
        wait for 100 ns;        
        
  -- End simulation
        wait;
    end process;

end Behavioral;
