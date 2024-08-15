----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2023 16:55:25
-- Design Name: 
-- Module Name: RCA_3 - Behavioral
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

entity RCA_3 is
    Port ( --A : in STD_LOGIC_VECTOR (2 downto 0);      -- Always this is equals to 001
           --C_in : in STD_LOGIC;                       -- Since we have to add, this shold be GROUND. i.e C_in = '0'
           B : in STD_LOGIC_VECTOR (2 downto 0);      -- 3-bit memory address input
           S : out STD_LOGIC_VECTOR (2 downto 0);     -- Next memory address will out
           C_out : out STD_LOGIC);                    --  This will not we care becuase our programme only have 8 instructions.
                                                      
end RCA_3;

architecture Behavioral of RCA_3 is

component FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;
SIGNAL C :std_logic_vector(1 downto 0);
begin

FA_0 : FA port map(
    A => '1', --A(0),
    B => B(0),
    C_in =>'0',
    S => S(0),
    C_out => C(0)
);

FA_1 : FA port map(
    A => '0', --A(1),
    B => B(1),
    C_in => C(0),
    S => S(1),
    C_out => C(1)
);

FA_2 : FA port map(
    A => '0', --A(2),
    B => B(2),
    C_in => C(1),
    S => S(2),
    C_out => C_out
);

end Behavioral;