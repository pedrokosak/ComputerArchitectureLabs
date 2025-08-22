library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is
    port(
        in_sel : in std_logic_vector(2 downto 0);
        out_dec: out std_logic_vector(7 downto 0)
    );
end entity;

architecture a_decoder of decoder is
    signal A, B, C: std_logic;
    signal D0, D1, D2, D3, D4, D5, D6, D7: std_logic;
begin
    
    A <= in_sel(2);
    B <= in_sel(1);
    C <= in_sel(0);

    D0 <= (not A) and (not B) and (not C);
    D1 <= (not A) and (not B) and C;
    D2 <= (not A) and B and (not C);
    D3 <= (not A) and B and C;
    D4 <= A and (not B) and (not C);
    D5 <= A and (not B) and C;
    D6 <= A and B and (not C);
    D7 <= A and B and C;

    out_dec(0) <= D0;
    out_dec(1) <= D1;
    out_dec(2) <= D2;
    out_dec(3) <= D3;
    out_dec(4) <= D4;
    out_dec(5) <= D5;
    out_dec(6) <= D6;
    out_dec(7) <= D7;

end architecture;