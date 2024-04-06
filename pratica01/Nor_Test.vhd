library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nor_Test is
    Port ( 
           clock: in std_logic;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end Nor_Test;

architecture RTLNOR of Nor_Test is

begin
    process
        begin
            wait until clock' event and clock = '1';
            if(a = '1' or b = '1')then
                x<= '0';
            else
                x<= '1';    
            end if;
    end process;

end RTLNOR;
