library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
    
entity TestBench is
--  Port ( );
end TestBench;

architecture Behavioral of TestBench is

    component fsm_mealy is
        Port(
            clock: in std_logic;
            rst: in std_logic;
            w: in std_logic;
            z: out std_logic
            );
    end component;
    
    signal reset: std_logic := '0';
    signal clock : std_logic := '1';
    signal w: std_logic := '0';
    signal z: std_logic;
    
    constant clock_frequencyHz: integer := 50e6;
    constant clock_periodo: time := 2000 ms / clock_frequencyHz;

begin
    
    DUT: entity work.fsm_mealy(rtlmealy)
    generic map(clock_frequencyHz => clock_frequencyHz)
    port map (reset,clock,w,z);
    
    clock <= not clock after clock_periodo/2;
    
    process 
    begin
    
        -- w = 0 1 0 1 1 0 1 1 1 0 1
        -- z = 0 0 0 0 1 0 0 1 1 0 0
        
        reset<='1'; wait for clock_periodo;
        reset<='0'; wait for clock_periodo;
        w<='0'; wait for clock_periodo;
        w<='1'; wait for clock_periodo;
        w<='0'; wait for clock_periodo;
        w<='1'; wait for clock_periodo;
        w<='1'; wait for clock_periodo;
        w<='0'; wait for clock_periodo;
        w<='1'; wait for clock_periodo;
        w<='1'; wait for clock_periodo;
        w<='1'; wait for clock_periodo;
        w<='0'; wait for clock_periodo;
        w<='1'; wait for clock_periodo;
        
        
    end process;
      
end Behavioral;
