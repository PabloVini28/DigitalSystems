library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
 
entity rs_test is
PORT( 
    S,R,CLOCK: in std_logic;
    Q, QB: out std_logic
    );
end rs_test;
 
architecture RTLRS of rs_test is
begin
    PROCESS
    variable tmp: std_logic;
        begin
        wait until clock' event and clock = '1';
            if(s= '0' and r = '0') then
                tmp:=tmp;   
            elsif(S='1' and R='1')then
              tmp:='0';   -- erro 
            elsif(S='0' and R='1')then
              tmp:='0';
            else
              tmp:='1';
            end if;
            Q <= tmp;
            QB <= not tmp;
   end PROCESS;
end RTLRS;
