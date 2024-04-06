library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FFD_Test is
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC;
           reset : in STD_LOGIC;
           q : out STD_LOGIC);
end FFD_Test;

architecture RTLFFD of FFD_Test is

begin
    process
        begin
        wait until clk' event and clk = '1';
            if(reset = '0')then
                q <= '0';
            else
                q<=d;
            end if;        
    end process;
end RTLFFD;
