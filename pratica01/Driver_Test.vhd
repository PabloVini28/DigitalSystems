library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Driver_Test is
    Port ( a : in STD_LOGIC;
           clock: in std_logic;
           b : out STD_LOGIC);
end Driver_Test;

architecture RTLDRIVER of Driver_Test is

begin
    process
        begin
            wait until clock' event and clock = '1';
                if(a = '1')then
                    b <= '1';
                else
                    b <= '0';  
                end if;      
    end process;

end RTLDRIVER;
