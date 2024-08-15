----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2023 06:28:30 AM
-- Design Name: 
-- Module Name: FA - Behavioral
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

entity FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end FA;

architecture Behavioral of FA is
component HA
    port (
    A: in std_logic;
    B: in std_logic;
    S: out std_logic;
    C: out std_logic);
end component;

SIGNAL HA0_C, HA0_S, HA1_S, HA1_C : std_logic;
signal NOT_A_out_sig : std_logic;
signal NOT_B_out_sig : std_logic;
signal NOT_Cin_out_sig : std_logic;

begin
HA_0 : HA
    port map (
    A => A,
    B => B,
    S => HA0_S,
    C => HA0_C);
 
HA_1 : HA
        port map (
        A => A,
        B => B,
        S => HA1_S,
        C => HA1_C);

NOT_A_out_sig <= NOT(A);
NOT_B_out_sig <= NOT(B);
NOT_Cin_out_sig <= NOT(C_in);
S <= (NOT_A_out_sig AND NOT_B_out_sig AND C_in) OR 
     (NOT_A_out_sig AND B AND NOT_Cin_out_sig ) OR 
     (A AND NOT_B_out_sig AND NOT_Cin_out_sig ) OR 
     (A AND B AND C_in);
C_out <= (NOT_A_out_sig AND B AND C_in) OR 
          (A AND NOT_B_out_sig AND C_in ) OR 
          (A AND B AND NOT_Cin_out_sig ) OR 
          (A AND B AND C_in);
     
end Behavioral;
