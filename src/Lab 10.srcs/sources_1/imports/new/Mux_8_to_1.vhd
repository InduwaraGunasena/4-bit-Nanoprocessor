----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2023 04:57:30 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
component Decoder_3_to_8 port(
    I: in STD_LOGIC_VECTOR;
    EN: in STD_LOGIC;
    Y: out STD_LOGIC_VECTOR );
end component;
signal i : STD_LOGIC_VECTOR(2 downto 0);
signal y0 : STD_LOGIC_VECTOR (7 downto 0);
signal en0, r0,r1,r2,r3,r4,r5,r6,r7 : STD_LOGIC;

begin
Decode_3_to_8 : Decoder_3_to_8
 port map(
    I => i,
    EN => en0,
    Y => y0 
 );
    
    en0 <= EN;    
    i <= S(2 downto 0);
    r0 <= y0(0) and D(0);
    r1 <= y0(1) and D(1);
    r2 <= y0(2) and D(2);
    r3 <= y0(3) and D(3);
    r4 <= y0(4) and D(4);
    r5 <= y0(5) and D(5);
    r6 <= y0(6) and D(6);
    r7 <= y0(7) and D(7);
    
    Y <= r0 or r1 or r2 or r3 or r4 or r5 or r6 or r7;

end Behavioral;
