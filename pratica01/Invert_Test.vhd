library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Invert_Test is
    Port ( 
           clock: in std_logic;
           a : in STD_LOGIC;
           x : out STD_LOGIC);
end Invert_Test;

architecture RTLINVERTED of Invert_Test is

begin
    process
        begin
            wait until clock' event and clock = '1';
            if(a = '1')then
                x<= '0';
            else
                x<= '1';    
            end if;
    end process;

end RTLINVERTED;
