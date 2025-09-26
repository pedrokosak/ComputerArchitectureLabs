-- Pedro Henrique Kosak Ferreira 2090856
-- Davi Riiti Goto Do Valle 1908030
-- Raphael Leite Diniz 2358549

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regFile is 
    port(
        CLK : in std_logic;
        RST : in std_logic;
        WE3 : in std_logic;
        A1, A2, A3 : in unsigned(2 downto 0);
        WD3 : in unsigned(15 downto 0);
        RD1, RD2 : out unsigned(15 downto 0)
    );
end entity;

architecture structural of regFile is
    component reg16bits is
        port( 	
            clk : in std_logic;
            rst : in std_logic;
            wr_en : in std_logic;
            data_in : in unsigned(15 downto 0);
            data_out : out unsigned(15 downto 0)
        );
    end component;
    signal s_reg_we : std_logic_vector(7 downto 0);

    type t_read_data_array is array (0 to 7) of unsigned(15 downto 0);
    signal s_reg_data_out : t_read_data_array;

begin

    DECODER_PROCESS: process(A3, WE3)
    begin
        for i in 0 to 7 loop
            if (to_integer(A3) = i) and (WE3 = '1') then
                s_reg_we(i) <= '1';
            else
                s_reg_we(i) <= '0';
            end if;
        end loop;
    end process DECODER_PROCESS;

    GEN_REGISTERS: for i in 0 to 7 generate
        REG_INSTANCE: reg16bits
            port map(
                clk      => CLK,
                rst      => RST,
                wr_en    => s_reg_we(i),          -- Conecta o WE individual
                data_in  => WD3,
                data_out => s_reg_data_out(i)
            );
    end generate GEN_REGISTERS;

    RD1 <= s_reg_data_out(to_integer(A1));
    RD2 <= s_reg_data_out(to_integer(A2));

end architecture structural;