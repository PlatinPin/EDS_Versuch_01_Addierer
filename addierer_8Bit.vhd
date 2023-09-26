library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity addierer_8Bit is
    generic(nbit: integer := 2);
    Port(
        by_1: in std_logic_vector(nbit-1 downto 0);
        by_2: in std_logic_vector(nbit-1 downto 0);
        c_in_8: in std_logic;
        y_8: out std_logic_vector(nbit-1 downto 0);
        c_out_8: out std_logic
    );
end addierer_8Bit;

architecture arch_addierer_8Bit of addierer_8Bit is
    signal s_internal: std_logic_vector(nbit-1 downto 0);
    signal s_y_internal: std_logic_vector(nbit-1 downto 0);
    component addierer_1Bit is 
        port(
            c_in, a,b : in std_logic; 
            c_out, y: out std_logic
            );
    end component;
begin
    U0: addierer_1Bit port map(a =>by_1(0), b=>by_2(0), c_in => C_in_8, c_out=>s_internal(0), y=>s_y_internal(0));
    
    G: for i in 1 to nbit-1 generate
        Ui: addierer_1Bit port map(a=>by_1(i), b=>by_2(i), c_in=>s_internal(i-1),c_out=>s_internal(i), y=>s_y_internal(i));
    end generate;
    
    y_8 <= s_y_internal;
    c_out_8 <= s_internal(nbit-1);
end arch_addierer_8Bit;
