library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF_Sim is
end D_FF_Sim;

architecture Behavioral of D_FF_Sim is
    -- Component declaration for the D_FF module
    component D_FF is
        Port (
            D : in STD_LOGIC;
            Res : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Q : out STD_LOGIC;
            Qbar : out STD_LOGIC
        );
    end component;

    -- Inputs/Outputs
    signal D_tb : STD_LOGIC := '0';
    signal Res_tb : STD_LOGIC := '0';
    signal Clk_tb : STD_LOGIC := '0';
    signal Q_tb : STD_LOGIC;
    signal Qbar_tb : STD_LOGIC;

    -- Clock period definition
    constant Clk_period : time := 10 ns;
    constant D_period : time := 12ns;  -- Oscillating period for D_tb
    
begin
    -- Instantiate the D_FF module
    UUT: D_FF
        port map (
            D => D_tb,
            Res => Res_tb,
            Clk => Clk_tb,
            Q => Q_tb,
            Qbar => Qbar_tb
        );

    -- Clock process
    Clock_process: process
    begin
        Clk_tb <= '0';
        wait for Clk_period/2;
        
        while (true) loop
            Clk_tb <= not Clk_tb;
            wait for Clk_period/2;
        end loop;
    end process;

    -- D_tb oscillating process
    D_process: process
    begin
        D_tb <= '0';
        wait for D_period/2;
        
        while (true) loop
            D_tb <= not D_tb;
            wait for D_period/2;
        end loop;
    end process;

    -- Stimulus process
    Stimulus_process: process
    begin
        -- Reset assertion
        Res_tb <= '1';
        wait for 100 ns;
                
        Res_tb <= '0';

        -- Wait for some time
        wait for Clk_period * 10;

        -- End simulation
        wait;
    end process;

end Behavioral;
