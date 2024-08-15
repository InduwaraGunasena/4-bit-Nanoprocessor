----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2023 02:40:18 AM
-- Design Name: 
-- Module Name: RCA_3_Sim - Behavioral
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

entity RCA_3_Sim is
--  Port ( );
end RCA_3_Sim;

architecture Behavioral of RCA_3_Sim is
    component RCA_3 is
         Port ( 
               --A : in STD_LOGIC_VECTOR (2 downto 0);      -- 3-bit memory address input
               --C_in : in STD_LOGIC;                       -- Since we have to add, this shold be GROUND. i.e C_in = '0'
               B : in STD_LOGIC_VECTOR (2 downto 0);      -- Always this is equals to 001
               S : out STD_LOGIC_VECTOR (2 downto 0);     -- Next memory address will out
               C_out : out STD_LOGIC);                    --  This will not we care becuase our programme only have 8 instructions.
    end component;
    
     -- Signal declarations
    signal B_tb, S_tb: STD_LOGIC_VECTOR (2 downto 0);
    signal C_out_tb: STD_LOGIC;
    
begin
    -- Instantiate the DUT (Design Under Test)
    uut: RCA_3
        port map (     
            B => B_tb,
            S => S_tb,
            C_out => C_out_tb
        );

    process
    begin

        -- Apply inputs
        B_tb <= "000";
        wait for 100 ns;
        
        B_tb <= "001";
        wait for 100 ns;
        
        B_tb <= "010";
        wait for 100 ns;
                
        B_tb <= "011";
        wait for 100 ns;
        
        B_tb <= "100";
        wait for 100 ns;
               
        B_tb <= "101";
        wait for 100 ns;
                        
        B_tb <= "110";
        wait for 100 ns;
                        
        B_tb <= "111";
        wait for 100 ns;                                

        wait;
    end process;

end Behavioral;
