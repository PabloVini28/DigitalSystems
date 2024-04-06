library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Or_Test is
    Port (  
           clock: std_logic;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end Or_Test;

architecture  RTLOR of Or_Test is

begin
    process
        begin
            wait until clock' event and clock = '1';
            if(a = '1' or b = '1')then
                x<= '1';
            else
                x<= '0';    
            end if;
    end process;

end RTLOR;
