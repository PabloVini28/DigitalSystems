library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_mealy_y2y1 is
generic(clock_frequencyHz: integer);
    Port ( 
           rst : in STD_LOGIC;
           clock : in STD_LOGIC;
           y1,y2: out std_logic;
           w : in STD_LOGIC;
           R1out,R1in,R2out,R2in,R3out,R3in,Done: out std_logic
           );
end fsm_mealy_y2y1;

architecture rtlmealy of fsm_mealy_y2y1 is
    
    type estados is (A,B,C);
    signal f: estados;
    

    begin
        process(clock,rst,w,f) 
            begin 
               if (rst = '1') then
                    f <= A;
               elsif(clock'event and clock = '1') then
                  case f is
                    when A =>
                       if w = '0' then
                           f <= A;
                           y2 <= '0';
                           y1 <= '0';  
                           R1out <= '0';
                           R1in <= '0';
                           R2out <= '0';
                           R2in <= '0';
                           R3out <= '0';
                           R3in <= '0';
                           Done <= '0';
                       else
                           f<= B;
                           y2 <= '0';
                           y1 <= '1';
                           R1out <= '0';
                           R1in <= '0';
                           R2out <= '1';
                           R2in <= '0';
                           R3out <= '0';
                           R3in <= '1';
                           Done <= '0';
                       end if;   
                    when B =>
                       if w = '0'then
                            f <= C;
                            y2 <= '1';
                            y1 <= '1';
                            R1out <= '1';
                            R1in <= '0';
                            R2out <= '0';
                            R2in <= '1';
                            R3out <= '0';
                            R3in <= '0';
                            Done <= '0';
                       else
                            f<= C;
                            y2 <= '1';
                            y1 <= '1';
                            R1out <= '1';
                            R1in <= '0';
                            R2out <= '0';
                            R2in <= '1';
                            R3out <= '0';
                            R3in <= '0';
                            Done <= '0';
                       end if;
                    when C =>
                       if w = '0'then
                            f <= A;
                            y2 <= '0';
                            y1 <= '0';
                            R1out <= '0';
                            R1in <= '1';
                            R2out <= '0';
                            R2in <= '0';
                            R3out <= '1';
                            R3in <= '0';
                            Done <= '1';
                       else
                            f <= A;
                            y2 <= '0';
                            y1 <= '0';
                            R1out <= '0';
                            R1in <= '1';
                            R2out <= '0';
                            R2in <= '0';
                            R3out <= '1';
                            R3in <= '0';
                            Done <= '1';
                       end if; 
                end case; 
            end if;          
        end process;
    
end rtlmealy;
