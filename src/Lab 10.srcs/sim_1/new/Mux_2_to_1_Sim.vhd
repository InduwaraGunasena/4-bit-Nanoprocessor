----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 10:30:30 AM
-- Design Name: 
-- Module Name: Mux_2_to_1_Sim - Behavioral
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

entity Mux_2_to_1_Sim is
--  Port ( );
end Mux_2_to_1_Sim;

architecture Behavioral of Mux_2_to_1_Sim is
    component Mux_2_to_1 is
        Port ( D : in STD_LOGIC_VECTOR (1 downto 0);
               S : in STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    -- Signals for the testbench
    signal D_tb : STD_LOGIC_VECTOR (1 downto 0);
    signal S_tb : STD_LOGIC;
    signal Y_tb : STD_LOGIC;
begin
    uut: Mux_2_to_1
        port map (D => D_tb, S => S_tb, Y => Y_tb);

    -- Stimulus process
    stimulus: process
    begin
        -- Test case 1 for check whether D(0) is the outhput  
        D_tb <= "00";
        S_tb <= '0';
        wait for 100 ns;
        
        D_tb <= "11";
        S_tb <= '0';
        wait for 100 ns;
        
        D_tb <= "01";
        S_tb <= '0';
        wait for 100 ns;
        
        D_tb <= "10";
        S_tb <= '0';
        wait for 100 ns;

        -- Test case 2 for check whether D(1) is the outhput
        D_tb <= "00";
        S_tb <= '1';
        wait for 100 ns;
        
        D_tb <= "11";
        S_tb <= '1';
        wait for 100 ns;
        
        D_tb <= "01";
        S_tb <= '1';
        wait for 100 ns;
        
        D_tb <= "10";
        S_tb <= '1';
        --wait for 100 ns;        
        
        -- End simulation
        wait;
    end process;

end Behavioral;
