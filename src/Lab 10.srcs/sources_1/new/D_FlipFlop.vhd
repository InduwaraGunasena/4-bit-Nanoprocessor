----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 11:29:18 AM
-- Design Name: 
-- Module Name: D_FlipFlop - Behavioral
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

entity D_FlipFlop is
    Port ( D_in : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC);
end D_FlipFlop;

architecture Behavioral of D_FlipFlop is

begin


end Behavioral;
