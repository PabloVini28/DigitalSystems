library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TestBench is
--  Port ( );
end TestBench; 
    
architecture Behavioral of TestBench is
    
    component fsm_moore_y2y1 
        port ( 
            clock: in std_logic;
            reset: in std_logic;
            w : in std_logic;
            y1,y2: in std_logic;
            z: out std_logic
        );
    end component;
    
    signal reset, clock: std_logic := '1';
    signal w : std_logic := '0';
    signal y1: std_logic := '0';
    signal y2: std_logic := '0';
    signal z : std_logic;
    
    constant clock_frequencyHz : integer := 50e6;
    constant clock_periodo : time := 2000 ms / clock_frequencyHz;
    
begin
    
    DUT: entity work.fms_moore_y2y1(rtl)
    generic map(clock_frequencyHz => clock_frequencyHz)
    port map(rst=>reset,clock=>clock,w=>w,z=>z,y1=>y1,y2=>y2);
    
    clock <= not clock after clock_periodo / 2;
    
    process 
    begin
    
        -- w = 0 1 0 1 1 0 1 1 1 0 1
        -- z = 0 0 0 0 0 1 0 0 1 1 0
        
        reset <= '1'; 
        wait for clock_periodo;
        reset <= '0'; 
        wait for clock_periodo;
        w <= '0'; 
        wait for clock_periodo;
        w <= '1'; 
        wait for clock_periodo;
        w <= '0'; 
        wait for clock_periodo;
        w <= '1'; 
        wait for clock_periodo;
        w <= '1'; 
        wait for clock_periodo;
        w <= '0'; 
        wait for clock_periodo;
        w <= '1'; 
        wait for clock_periodo;
        w <= '1'; 
        wait for clock_periodo;
        w <= '1'; 
        wait for clock_periodo;
        w <= '0'; 
        wait for clock_periodo;
        w <= '1'; 
        wait for clock_periodo;
        
    end process;

end Behavioral;

