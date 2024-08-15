----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 02:14:56 AM
-- Design Name: 
-- Module Name: Register_Bank_Sim - Behavioral
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

entity Register_Bank_Sim is
--  Port ( );
end Register_Bank_Sim;

architecture Behavioral of Register_Bank_Sim is

  component Register_Bank is
    Port ( D_input : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
           Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           D_out0 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out1 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out2 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out3 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out4 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out5 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out6 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out7 : out STD_LOGIC_VECTOR (3 downto 0));
  end component;

  signal D_input_tb : STD_LOGIC_VECTOR (3 downto 0);
  signal Reg_En_tb : STD_LOGIC_VECTOR (2 downto 0);
  signal Clock_tb : STD_LOGIC := '0';
  signal Rst : STD_LOGIC;
  signal D_out0_tb : STD_LOGIC_VECTOR (3 downto 0);
  signal D_out1_tb : STD_LOGIC_VECTOR (3 downto 0);
  signal D_out2_tb : STD_LOGIC_VECTOR (3 downto 0);
  signal D_out3_tb : STD_LOGIC_VECTOR (3 downto 0);
  signal D_out4_tb : STD_LOGIC_VECTOR (3 downto 0);
  signal D_out5_tb : STD_LOGIC_VECTOR (3 downto 0);
  signal D_out6_tb : STD_LOGIC_VECTOR (3 downto 0);
  signal D_out7_tb : STD_LOGIC_VECTOR (3 downto 0);

  constant Clk_period : time := 100 ns;

begin
  uut: Register_Bank
  port map (  D_input => D_input_tb,
              Reg_En => Reg_En_tb,
              Clock => Clock_tb,
              Reset => Rst,
              D_out0 => D_out0_tb,
              D_out1 => D_out1_tb,
              D_out2 => D_out2_tb,
              D_out3 => D_out3_tb,
              D_out4 => D_out4_tb,
              D_out5 => D_out5_tb,
              D_out6 => D_out6_tb,
              D_out7 => D_out7_tb);

  Clock_process: process
  begin
    while now < 4000 ns loop
      Clock_tb <= '0';
      wait for Clk_period/2;
      Clock_tb <= '1';
      wait for Clk_period/2;
    end loop;
    wait;
  end process;

  Stimulus_process: process
  begin
    -- Initialize inputs
    Rst <= '1';
    wait for Clk_period;

    -- Apply inputs
    Rst <= '0';
    D_input_tb <= "1100";
    Reg_En_tb <= "011";
    wait for Clk_period;
    
    -- Apply inputs 
    D_input_tb <= "1010";
    Reg_En_tb <= "101";
    wait for Clk_period;
    
    Rst <= '1';
    D_input_tb <= "0000";   --Remember reset D_input also to zero after reset registers
    --Reg_En_tb <= "101";
    wait for Clk_period;
    Rst <= '0';

    wait;
  end process;

end Behavioral;
