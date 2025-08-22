library ieee;
use ieee.std_logic_1164.all;

entity decoder_tb is
end entity;

architecture a_decoder_tb of decoder_tb is
    component decoder
        port(
            in_sel : in std_logic_vector(2 downto 0);
            out_dec: out std_logic_vector(7 downto 0)
        );
    end component;

    signal s_in_sel : std_logic_vector(2 downto 0);
    signal s_out_dec: std_logic_vector(7 downto 0);

begin
    uut: decoder port map(
        in_sel  => s_in_sel,
        out_dec => s_out_dec
    );

    process
    begin
        
        s_in_sel <= "000"; 
        wait for 10 ns;

        s_in_sel <= "001"; 
        wait for 10 ns;

        s_in_sel <= "010"; 
        wait for 10 ns;

        s_in_sel <= "011"; 
        wait for 10 ns;
        
        s_in_sel <= "100"; 
        wait for 10 ns;

        s_in_sel <= "101"; 
        wait for 10 ns;

        s_in_sel <= "110"; 
        wait for 10 ns;
        
        s_in_sel <= "111"; 
        wait for 10 ns;

        wait;
    end process;
end architecture;