library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fsm_moore is
generic(clock_frequencyHz : integer);
  Port ( 
    rst   : in std_logic;
    clock : in std_logic;    
    w     : in std_logic;
    z     : out std_logic
  );
end fsm_moore;

architecture rtl of fsm_moore is
    type estados is (A, B, C);
    signal y : estados;    
begin
    process(w,rst,clock)
    begin
        if(rst = '1')then
            y<=A;
        elsif(clock'event and clock = '0')then
            case y is
                when A =>
                    if(w = '0')then
                        y <= A;
                    else
                        y <= B;
                    end if;
                when B =>
                    if(w = '0')then
                        y <= A;
                    else
                        y <= C;
                    end if;
                when C =>
                    if(w = '0')then
                        y <= A;
                    else
                        y <= C;
                    end if;
            end case;
        end if;
     end process;
     
     process(rst, clock)
     begin
     if(y = C)   then z <= '1';
        else z <= '0';
        end if;
      end process;
    
end rtl;