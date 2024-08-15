----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 12:21:16 PM
-- Design Name: 
-- Module Name: PC_3bit_Sim - Behavioral
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

entity PC_3bit_Sim is
--  Port ( );
end PC_3bit_Sim;

architecture Behavioral of PC_3bit_Sim is
    -- Component declaration for the PC_3bit module
    component PC_3bit is
        Port (
            Reset : in STD_LOGIC;
            Clk : in STD_LOGIC;
            MemorySelect : inout STD_LOGIC_VECTOR (2 downto 0);
            JumpAddr : in STD_LOGIC_VECTOR (2 downto 0);
            JumpFlag : in STD_LOGIC
        );
    end component;
    
    component Slow_Clk is
            Port (
                Clk_in : in STD_LOGIC;
                Clk_out : out STD_LOGIC );
    end component;

    -- Inputs
    signal Reset_tb : STD_LOGIC := '0';
    signal Clk_tb : STD_LOGIC := '0';
    signal Slow_Clk_tb : STD_LOGIC;
    signal JumpAddr_tb : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal JumpFlag_tb : STD_LOGIC := '0';

    -- Outputs
    signal MemorySelect_tb : STD_LOGIC_VECTOR (2 downto 0);

    -- Clock period definition
    constant Clk_period : time := 10 ns;
    constant T : time := Clk_period * 20;   -- This is the actual clock period which feel the PC.
    
begin
    -- Instantiate the PC_3bit module
    UUT: PC_3bit
        port map (
            Reset => Reset_tb,
            Clk => Clk_tb,
            MemorySelect => MemorySelect_tb,
            JumpAddr => JumpAddr_tb,
            JumpFlag => JumpFlag_tb
        );
        
    UUT_Slow_Clk: Slow_Clk
         port map (
            Clk_in => Clk_tb,
            Clk_out => Slow_Clk_tb
        );


    -- Clock process
   Clk_process: process
    begin
        Clk_tb <= '0';
        wait for Clk_period/2;
        Clk_tb <= '1';
        wait for Clk_period/2;
    end process;

    -- Stimulus process
    process
    begin
        -- Reset assertion
        Reset_tb <= '1';
        wait for T;
                
        Reset_tb <= '0';

        -- Wait for 5 clock cycles
        wait for T * 5;
            
        -- Set JumpAddr_tb to test jump instruction
        JumpAddr_tb <= "011";
        JumpFlag_tb <= '1';

        -- Wait for 3 clock cycles
        wait for T;

        -- Set JumpFlag_tb to disable jump instruction
        --JumpAddr_tb <= "000";
        JumpFlag_tb <= '0';
        
        -- Wait for 5 clock cycles
        wait for T * 5;
        
        JumpAddr_tb <= "100";
        JumpFlag_tb <= '1';
        
        -- Wait for 3 clock cycles
        wait for T;
        
        -- Set JumpFlag_tb to disable jump instruction
        JumpFlag_tb <= '0';
        
        -- End simulation
        wait;
    end process;

end Behavioral;
