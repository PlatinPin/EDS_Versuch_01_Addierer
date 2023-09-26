library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity addierer_1Bit is
    Port (
        c_in, a,b : in std_logic;
        c_out, y: out std_logic 
    );
end addierer_1Bit;

architecture arch_proc of addierer_1Bit is
begin
    process(a,b,c_in)
        begin
            y <= (a xor b) xor c_in;
            c_out <= (b and c_in) or (a and c_in) or (a and b);
    end process;
end arch_proc;
