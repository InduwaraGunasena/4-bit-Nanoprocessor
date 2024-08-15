----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 04:37:48 PM
-- Design Name: 
-- Module Name: Add_Sub_Sim - Behavioral
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

entity Add_Sub_Sim is
--  Port ( );
end Add_Sub_Sim;

architecture Behavioral of Add_Sub_Sim is

    -- Component declaration
    component Add_Sub_4bit is
         Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
              B : in STD_LOGIC_VECTOR (3 downto 0);
              S : inout STD_LOGIC_VECTOR (3 downto 0);
              AddSubSelect : in STD_LOGIC;
              Zero : out STD_LOGIC;
              Overflow : out STD_LOGIC
        );
    end component;

    -- Signal declarations
    signal A_tb, B_tb, S_tb: STD_LOGIC_VECTOR (3 downto 0);
    signal subtract_tb, C_out_tb, zero: STD_LOGIC;

begin

    -- Instantiate the DUT (Design Under Test)
    uut: Add_Sub_4bit
        port map (
            A => A_tb,
            B => B_tb,
            S => S_tb,
            AddSubSelect => subtract_tb,
            Overflow => C_out_tb,
            Zero => zero
        );

    -- Stimulus process
    process
    begin
        -- Initialize inputs
        A_tb <= "0000";
        B_tb <= "0000";
        subtract_tb <= '0';

        -- Apply inputs
        wait for 100 ns;
        A_tb <= "0010";
        B_tb <= "0001";
        subtract_tb <= '0';

        wait for 100 ns;
        A_tb <= "0100";
        B_tb <= "0011";
        subtract_tb <= '0';

        wait for 100 ns;
        A_tb <= "1010";
        B_tb <= "0101";
        subtract_tb <= '1';

        wait for 100 ns;
        A_tb <= "1111";
        B_tb <= "0110";
        subtract_tb <= '1';

        wait for 100 ns;
        A_tb <= "1100";
        B_tb <= "1001";
        subtract_tb <= '1';

        wait;
    end process;

end Behavioral;
