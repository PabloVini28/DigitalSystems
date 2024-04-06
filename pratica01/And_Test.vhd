library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity And_Test is
    Port ( 
           clock: in std_logic; 
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end And_Test;

architecture RTLAND of And_Test is

begin
    process
        begin
            wait until clock' event and clock = '1';
            if(a = '1' and b = '1')then
                x <= '1';
            else 
                x<= '0';
            end if;        
    end process;
end RTLAND;
