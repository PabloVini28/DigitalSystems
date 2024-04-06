library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_mealy is
generic(clock_frequencyHz: integer);
    Port ( 
           rst : in STD_LOGIC;
           clock : in STD_LOGIC;
           w : in STD_LOGIC;
           z : out STD_LOGIC
           );
end fsm_mealy;

architecture rtlmealy of fsm_mealy is
    
    type estados is (A,B);
    signal y: estados;
    

    begin
        process(clock,rst) 
            begin 
               if rst = '1' then
                    y <= A;
               elsif rising_edge(clock) then
                  case y is
                    when A =>
                       if w = '0' then
                           y <= A;
                       else
                           y<= B;
                       end if;   
                    when B =>
                       if w = '0'then
                            y <= A;
                       else
                            y<= B;
                       end if;
                end case; 
            end if;          
        end process;
        
            process(clock,y,w)
            begin
            if y = B and w = '1' then
                z <= w;    
            else
                z <= '0';           
            end if;
    end process;

end rtlmealy;
