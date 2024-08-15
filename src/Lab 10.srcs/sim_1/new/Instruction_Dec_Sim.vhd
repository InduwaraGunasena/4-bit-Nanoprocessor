----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 09:56:07 PM
-- Design Name: 
-- Module Name: Instruction_Dec_Sim - Behavioral
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

entity Instruction_Dec_Sim is
--  Port ( );
end Instruction_Dec_Sim;

architecture Behavioral of Instruction_Dec_Sim is
-- Component declaration
    component Instruction_Dec is
        Port (
            Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
            Load_Select : out STD_LOGIC;
            Immediate_Val : out STD_LOGIC_VECTOR (3 downto 0);
            MuxA_Select : out STD_LOGIC_VECTOR (2 downto 0);
            MuxB_Select : out STD_LOGIC_VECTOR (2 downto 0);
            AddSub_Select : out STD_LOGIC;
            JmpFlag : out STD_LOGIC;
            JmpAddr : out STD_LOGIC_VECTOR (2 downto 0);
            Instruct_Bus : in STD_LOGIC_VECTOR (11 downto 0);
            JumpCheck : in STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Signals declaration
    signal Instruct_Bus_TB : STD_LOGIC_VECTOR (11 downto 0);
    signal JumpCheck_TB : STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_En_TB : STD_LOGIC_VECTOR (2 downto 0);
    signal Load_Select_TB : STD_LOGIC;
    signal Immediate_Val_TB : STD_LOGIC_VECTOR (3 downto 0);
    signal MuxA_Select_TB : STD_LOGIC_VECTOR (2 downto 0);
    signal MuxB_Select_TB : STD_LOGIC_VECTOR (2 downto 0);
    signal AddSub_Select_TB : STD_LOGIC;
    signal JmpFlag_TB : STD_LOGIC;
    signal JmpAddr_TB : STD_LOGIC_VECTOR (2 downto 0);

begin
    -- Component instantiation
    UUT: Instruction_Dec
        Port map (
            Reg_En => Reg_En_TB,
            Load_Select => Load_Select_TB,
            Immediate_Val => Immediate_Val_TB,
            MuxA_Select => MuxA_Select_TB,
            MuxB_Select => MuxB_Select_TB,
            AddSub_Select => AddSub_Select_TB,
            JmpFlag => JmpFlag_TB,
            JmpAddr => JmpAddr_TB,
            Instruct_Bus => Instruct_Bus_TB,
            JumpCheck => JumpCheck_TB
        );

    -- Stimulus process
    stimulus_proc: process
    begin
        -- Test case 1: ADD instruction
        Instruct_Bus_TB <= "111010000110";
        JumpCheck_TB <= "0100";
        wait for 10 ns;
        assert (Reg_En_TB = "111") report "Test case 1 failed: Incorrect Reg_En value" severity error;
        assert (Load_Select_TB = '0') report "Test case 1 failed: Incorrect Load_Select value" severity error;
        assert (Immediate_Val_TB = "0000") report "Test case 1 failed: Incorrect Immediate_Val value" severity error;
        assert (MuxA_Select_TB = "111") report "Test case 1 failed: Incorrect MuxA_Select value" severity error;
        assert (MuxB_Select_TB = "010") report "Test case 1 failed: Incorrect MuxB_Select value" severity error;
        assert (AddSub_Select_TB = '0') report "Test case 1 failed: Incorrect AddSub_Select value" severity error;
        assert (JmpFlag_TB = '0') report "Test case 1 failed: Incorrect JmpFlag value" severity error;
        assert (JmpAddr_TB = "000") report "Test case 1 failed: Incorrect JmpAddr value" severity error;

        

        -- Add more test cases if needed

        wait;
    end process stimulus_proc;

end Behavioral;