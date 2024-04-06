library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

------------------------------

-- ALUNO: PABLO VINÍCIOS DA SILVA ARAÚJO - 538616
-- AS ÁREAS COMENTADAS ESTÃO DESSA FORMA PARA TESTAR NA PLACA

entity TestBench is
  Port ( 
    signal clock: in std_logic;
    signal a,b: in std_logic;
    signal x_and:out std_logic;
    signal x_or:out std_logic;
    signal x_sum:out std_logic;
    signal x_carry_out:out std_logic
  
        );
end TestBench;

architecture Behavioral of TestBench is

    component and_test is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
            );
    end component;
    
    component or_test is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic 
        );
    end component;
    
    component nand_test is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
            );
    end component;
    
    component nor_test is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
            );
    end component;
    
    component xor_test is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
            );
    end component;
    
    component xnor_test is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
            );
    end component;
    
    component invert_test is
        port(
            clock: in std_logic;
            a: in std_logic;
            x: out std_logic
            );
    end component;
    
    component ffd_test is
        port(
            clk: in std_logic;
            reset: in std_logic;
            d: in std_logic;
            q: out std_logic
            );
    end component;
    
   component rs_test is
        port(
            clock,r,s : in std_logic;
            q,qb: out std_logic
        );
    end component;
    
    component driver_test is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: out std_logic
            );
    end component;
    
    component half_test is 
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            sum: out std_logic;
            carry_out: out std_logic
        );
    end component;    
    
    constant clock_periodo:time:=100 ns;
    
    --signal x_and:std_logic;
    signal x_nand:std_logic;
    --signal x_or:std_logic;
    signal x_nor:std_logic;
    signal x_xor:std_logic;
    signal x_xnor:std_logic;
    signal x_invert:std_logic;
    signal x_ffd:std_logic;
    signal q_ffrs:std_logic;
    signal qb_ffrs:std_logic;
    signal x_driver:std_logic;
    --signal x_sum:std_logic;
    --signal x_carry_out:std_logic;
    
begin

    --clock<= not clock after clock_periodo/2;
    DUT1: and_test port map(clock,a,b,x_and);
    DUT2: nand_test port map(clock,a,b,x_nand);
    DUT3: or_test port map(clock,a,b,x_or);
    DUT4: nor_test port map(clock,a,b,x_nor);
    DUT5: xor_test port map(clock,a,b,x_xor);
    DUT6: xnor_test port map(clock,a,b,x_xnor);
    DUT7: invert_test port map(clock,a,x_invert);
    DUT8: rs_test port map(clock,a,b,q_ffrs,qb_ffrs);
    DUT9: ffd_test port map(clock,a,b,x_ffd);
    DUT10:driver_test port map(clock,a,x_driver);
    DUT11:half_test port map(clock, a,b,x_sum,x_carry_out);
    
    estimulos:process
    begin
        --a<='0';
        --b<='0';
        --wait for clock_periodo;
        --a<='0';
        --b<='1';
        --wait for clock_periodo;
        --a<='1';
        --b<='0';
        --wait for clock_periodo;
        --a<='1';
        --b<='1';
        --wait for clock_periodo;
      
    end process;
end Behavioral;
