library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Test is
    Port ( 
           clock: in std_logic;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end Half_Test;

architecture RTLHALF of Half_Test is

begin
    process 
        begin
        wait until clock' event and clock = '1';
            if(a = '1')then
                sum <= not b;
                carry_out <= b;
            else
                sum<=b;
                carry_out <= '0';    
            end if;    
    end process;
end RTLHALF;
