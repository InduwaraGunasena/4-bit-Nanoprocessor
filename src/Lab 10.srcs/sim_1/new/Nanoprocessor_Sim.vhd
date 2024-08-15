----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 08:39:09 PM
-- Design Name: 
-- Module Name: Nanoprocessor_Sim - Behavioral
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

entity Nanoprocessor_Sim is
--  Port ( );
end Nanoprocessor_Sim;

architecture Behavioral of Nanoprocessor_Sim is

    component Nanoprocessor is
    Port ( Reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           Zero_LED : out STD_LOGIC;
           Overflow_LED : out STD_LOGIC;
           LED0 : out STD_LOGIC;
           LED1 : out STD_LOGIC;
           LED2 : out STD_LOGIC;
           LED3 : out STD_LOGIC       
    );
    end component;

signal reset : STD_LOGIC;
signal clock : STD_LOGIC;
signal zero_LED : STD_LOGIC;
signal overflow_LED : STD_LOGIC;
signal led0 : STD_LOGIC;
signal led1 : STD_LOGIC;
signal led2 : STD_LOGIC;
signal led3 : STD_LOGIC;
  
constant Clk_period : time := 10 ns;
constant T : time := Clk_period * 20;

begin
    uut : Nanoprocessor
    port map (
        Reset => reset,
        clk => clock,
        Zero_LED => zero_LED,
        Overflow_LED => overflow_LED,
        LED0 => led0,
        LED1 => led1,
        LED2 => led2,
        LED3 => led3
    );
    
    Clock_process: process
      begin
        while now < 100 us loop
          clock <= '0';
          wait for Clk_period/2;
          clock <= '1';
          wait for Clk_period/2;
        end loop;
        wait;
      end process;
      
    Stimulus_process: process
    begin
        -- Initialize inputs
        reset <= '1';
        wait for T;
        
        reset <= '0';
        wait for T*7;
        
        reset <= '1';
        wait for T;
        
        reset <= '0';
        wait;
    end process;
end Behavioral;
