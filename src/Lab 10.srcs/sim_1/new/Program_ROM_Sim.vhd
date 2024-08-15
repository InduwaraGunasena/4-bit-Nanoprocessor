----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 03:37:47 PM
-- Design Name: 
-- Module Name: Program_ROM_Sim - Behavioral
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

entity Program_ROM_Sim is
--  Port ( );
end Program_ROM_Sim;

architecture Behavioral of Program_ROM_Sim is

component Program_ROM is
    Port ( MemSelect : in STD_LOGIC_VECTOR (2 downto 0);
           InstructBus : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal MemSelect : STD_LOGIC_VECTOR (2 downto 0);
signal InstructBus : STD_LOGIC_VECTOR (11 downto 0);

begin
    uut : Program_ROM
    port map (
        MemSelect => MemSelect,
        InstructBus => InstructBus
    );
    
    process
    begin
        MemSelect <= "001";
        wait for 10ns;
        
        MemSelect <= "011";
        wait for 10ns;        
        
        MemSelect <= "101";
        wait for 10ns;
        
        MemSelect <= "010";
        wait for 10ns;
    end process;
end Behavioral;
