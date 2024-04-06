library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fms_moore_y2y1 is
generic(clock_frequencyHz : integer);
  Port ( 
    rst   : in std_logic;
    y1: out std_logic;
    y2: out std_logic; 
    clock : in std_logic;    
    w     : in std_logic;
    z     : out std_logic
  );
end fms_moore_y2y1;

architecture rtl of fms_moore_y2y1 is

    type estados is (A, B, C);
    signal f : estados;
    
      
begin
    process(w,rst,clock)
    begin
        if(rst = '1')then
            f <= A;
        elsif(clock'event and clock = '1')then
            case f is
                when A =>
                    if(w = '0')then
                        f<=A;
                        y1<='0';
                        y2<= '0';
                    else
                        f <= B;
                        y1<='1';
                        y2<= '0';
                    end if;
                when B =>
                    if(w = '0')then
                        f <= A;
                        y1<='0';
                        y2<= '0';
                    else
                        f <= C;
                        y1<='0';
                        y2<= '1';
                    end if;
                when C =>
                    if(w = '0')then
                        f <= A;
                        y1<='0';
                        y2<= '0';
                    else
                        f <= C;
                        y1<='0';
                        y2<= '1';
                    end if;
            end case;
        end if;
     end process;  
     
     process(rst, clock,w,f)
     begin
        if(f = C)then 
            z<= '1';
        else z <= '0';
        end if;
     end process;
             
    
end rtl;