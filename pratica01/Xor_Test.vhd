library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Xor_Test is
    Port ( 
           clock: in std_logic;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end Xor_Test;

architecture RTLXOR of Xor_Test is

begin
    process
        begin
            wait until clock' event and clock = '1';
            if((a = '1' and b = '1') or (a = '0' and b = '0'))then
                x<= '0';
            else
                x<= '1';    
            end if;
    end process;

end RTLXOR;
