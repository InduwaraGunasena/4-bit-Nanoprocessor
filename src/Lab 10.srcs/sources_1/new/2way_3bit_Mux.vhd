----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 09:22:34 AM
-- Design Name: 
-- Module Name: 2way_3bit_Mux - Behavioral
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

entity 2way_3bit_Mux is
    Port ( 3bit_adder : in STD_LOGIC_VECTOR (2 downto 0);
           jmp_adrs : in STD_LOGIC_VECTOR (3 downto 0);
           jmp_flag : in STD_LOGIC;
           out : out STD_LOGIC_VECTOR (2 downto 0));
end 2way_3bit_Mux;

architecture Behavioral of 2way_3bit_Mux is

begin


end Behavioral;
