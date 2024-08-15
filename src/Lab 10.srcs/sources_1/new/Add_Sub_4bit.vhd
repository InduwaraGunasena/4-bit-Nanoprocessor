----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 03:09:42 PM
-- Design Name: 
-- Module Name: Add_Sub_4bit - Behavioral
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

entity Add_Sub_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : inout STD_LOGIC_VECTOR (3 downto 0);
           AddSubSelect : in STD_LOGIC;
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC);
end Add_Sub_4bit;

architecture Behavioral of Add_Sub_4bit is

    component RCA_4 is
        Port ( A0 : in STD_LOGIC;
               A1 : in STD_LOGIC;
               A2 : in STD_LOGIC;
               A3 : in STD_LOGIC;
               B0 : in STD_LOGIC;
               B1 : in STD_LOGIC;
               B2 : in STD_LOGIC;
               B3 : in STD_LOGIC;
               C_in : in STD_LOGIC;
               S1 : out STD_LOGIC;
               S2 : out STD_LOGIC;
               S3 : out STD_LOGIC;
               C_out : out STD_LOGIC;
               S0 : out STD_LOGIC);
    end component;
    
    --signal B_inverted : STD_LOGIC_VECTOR(3 downto 0); -- Signal for inverting B when subtracting
    signal Q0,Q1,Q2,Q3 :STD_LOGIC;

begin
    Q0 <= B(0) XOR AddSubSelect;
    Q1 <= B(1) XOR AddSubSelect;
    Q2 <= B(2) XOR AddSubSelect;
    Q3 <= B(3) XOR AddSubSelect;

    Add_Sub : RCA_4
        port map(
            A0 => A(0),
            A1 => A(1),
            A2 => A(2),
            A3 => A(3),
            B0 => Q0,
            B1 => Q1,
            B2 => Q2,
            B3 => Q3,
            S0 => S(0),
            S1 => S(1),
            S2 => S(2),
            S3 => S(3),
            C_in => AddSubSelect,
            C_out => Overflow);
            
    Zero <= NOT(S(0) OR S(1) OR S(2) OR S(3));    
    
end Behavioral;





