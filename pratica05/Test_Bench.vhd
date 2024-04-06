library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Test_Bench is
--  Port ( );
end Test_Bench;

architecture Behavioral of Test_Bench is
    
    component fsm_mealy is
        Port(
            clock: in std_logic;
            rst: in std_logic;
            w: in std_logic;
            y1,y2: out std_logic;
            R1out,R1in,R2out,R2in,R3out,R3in,Done: out std_logic
            );
     end component;  
     
    signal reset: std_logic := '1';
    signal clock: std_logic := '1';
    signal y1: std_logic := '0';
    signal y2: std_logic := '0';
    signal w: std_logic := '0';
    signal R1in: std_logic := '0';
    signal R1out: std_logic := '0';
    signal R2in: std_logic := '0';
    signal R2out: std_logic := '0';
    signal R3in: std_logic := '0';
    signal R3out: std_logic := '0';
    signal Done: std_logic := '0';
    
    constant clock_frequencyHz : integer := 50e6;
    constant clock_periodo : time := 2000 ms / clock_frequencyHz;
    
begin
    
    DUT: entity work.fsm_mealy_y2y1(rtlmealy)
    generic map(clock_frequencyHz => clock_frequencyHz)
    port map(rst=>reset,clock=>clock,w=>w,y1=>y1,y2=>y2,R3out=>R3out,R2out=>R2out,R1out=>R1out,R3in=>R3in,R2in=>R2in,R1in=>R1in,Done=>Done);
    
    clock <= not clock after clock_periodo / 2;
    
    process 
    begin
    
        -- w = 0 1 0 1 1 0 1 1 1 0 1
        -- z = 0 0 0 0 1 0 0 1 1 0 0
        
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
