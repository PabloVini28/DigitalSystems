library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
    component AND_TESTE is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );
    end component;
   component or_TESTE is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );    
    end component;
    signal clock: std_logic := '1';
    signal a,b: std_logic := '0';
    signal x_and: std_logic;
    signal x_or: std_logic;
    constant clock_periodo:time:= 100 ns;
        
begin
    clock<= not clock after clock_periodo/2;
    DUT1:and_teste port map(clock,a,b,x_and);
    DUT2:or_teste port map(clock,a,b,x_or);

    estimulos:process
    begin
        --teste1
        a<='0';
        b<='0';
        wait for clock_periodo;
        --teste2
        a<='0';
        b<='1';
        wait for clock_periodo;
        --teste3
        a<='1';
        b<='0';
        wait for clock_periodo;
        --teste4
        a<='1';
        b<='1';
        wait for clock_periodo;
    
    end process;
end Behavioral;










