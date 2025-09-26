-- Pedro Henrique Kosak Ferreira 2090856
-- Davi Riiti Goto Do Valle 1908030
-- Raphael Leite Diniz 2358549

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity regFile_tb is
end entity;

architecture test of regFile_tb is
    component regFile is 
        port(
            CLK : in std_logic;
            RST : in std_logic;
            WE3 : in std_logic;
            A1, A2, A3 : in unsigned(2 downto 0);
            WD3 : in unsigned(15 downto 0);
            RD1, RD2 : out unsigned(15 downto 0)
        );
    end component;

    signal s_CLK : std_logic := '0';
    signal s_RST : std_logic;
    signal s_WE3 : std_logic;
    signal s_A1, s_A2, s_A3 : unsigned(2 downto 0);
    signal s_WD3 : unsigned(15 downto 0);
    signal s_RD1, s_RD2 : unsigned(15 downto 0);

    -- Configuração do Clock
    constant c_CLK_PERIOD : time := 10 ns;

begin
    UUT: regFile
        port map(
            CLK => s_CLK,
            RST => s_RST,
            WE3 => s_WE3,
            A1  => s_A1,
            A2  => s_A2,
            A3  => s_A3,
            WD3 => s_WD3,
            RD1 => s_RD1,
            RD2 => s_RD2
        );

    CLK_PROCESS: process
    begin
        s_CLK <= '0';
        wait for c_CLK_PERIOD / 2;
        s_CLK <= '1';
        wait for c_CLK_PERIOD / 2;
    end process CLK_PROCESS;

    STIMULUS_PROCESS: process
        -- Constantes para os valores de teste, para deixar o código mais legível
        constant C_VALOR_1 : unsigned(15 downto 0) := unsigned'(x"4A88"); -- 0100101010001000 - 19080
        constant C_VALOR_2 : unsigned(15 downto 0) := unsigned'(x"5C21"); -- 0101110000100001 - 23585
        constant C_VALOR_3 : unsigned(15 downto 0) := unsigned'(x"51AC"); -- 0101000110101100 - 20908
        
        -- Constantes para os endereços dos registradores
        constant C_ADDR_1 : unsigned(2 downto 0) := "001"; -- Registrador 1
        constant C_ADDR_2 : unsigned(2 downto 0) := "010"; -- Registrador 2
        constant C_ADDR_3 : unsigned(2 downto 0) := "101"; -- Registrador 5
    begin
        report "Inicio da simulacao do Banco de Registradores.";

        -- >> TESTE 1: RESET GERAL <<
        s_RST <= '1';
        s_WE3 <= '0';
        s_A1  <= (others => '0');
        s_A2  <= (others => '0');
        s_A3  <= (others => '0');
        s_WD3 <= (others => '0');
        wait for c_CLK_PERIOD * 2; -- Mantém o reset por 2 ciclos de clock
        s_RST <= '0';
        report "Reset finalizado.";
        wait for c_CLK_PERIOD; -- Espera um ciclo para estabilizar

        -- >> TESTE 2: ESCRITA NOS REGISTRADORES <<
        report "Escrevendo valores nos registradores.";
        s_WE3 <= '1';

        s_A3  <= C_ADDR_1;
        s_WD3 <= C_VALOR_1;
        wait until rising_edge(s_CLK);

        s_A3  <= C_ADDR_2;
        s_WD3 <= C_VALOR_2;
        wait until rising_edge(s_CLK);

        s_A3  <= C_ADDR_3;
        s_WD3 <= C_VALOR_3;
        wait until rising_edge(s_CLK);

        s_WE3 <= '0';
        report "Escrita finalizada.";
        wait for c_CLK_PERIOD;

        -- >> TESTE 3: LEITURA PELA PORTA RD2 <<
        report "Etapa 3: Lendo valores pela porta RD2.";
        
        s_A2 <= C_ADDR_1;
        wait for c_CLK_PERIOD / 4; -- Espera um tempo para o dado se propagar
        assert s_RD2 = C_VALOR_1 report "ERRO RD2! Leitura do REG 1 falhou." severity error;
        
        s_A2 <= C_ADDR_2;
        wait for c_CLK_PERIOD / 4;
        assert s_RD2 = C_VALOR_2 report "ERRO RD2! Leitura do REG 2 falhou." severity error;
        
        s_A2 <= C_ADDR_3;
        wait for c_CLK_PERIOD / 4;
        assert s_RD2 = C_VALOR_3 report "ERRO RD2! Leitura do REG 5 falhou." severity error;
        wait for c_CLK_PERIOD;

        -- >> TESTE 4: LEITURA PELA PORTA RD1 <<
        report "Etapa 4: Lendo valores pela porta RD1...";
        s_A2 <= (others => '0'); -- Zera A2 para não interferir

        s_A1 <= C_ADDR_1;
        wait for c_CLK_PERIOD / 4; 
        assert s_RD1 = C_VALOR_1 report "ERRO RD1! Leitura do REG 1 falhou." severity error;
        
        s_A1 <= C_ADDR_2;
        wait for c_CLK_PERIOD / 4;
        assert s_RD1 = C_VALOR_2 report "ERRO RD1! Leitura do REG 2 falhou." severity error;
        
        s_A1 <= C_ADDR_3;
        wait for c_CLK_PERIOD / 4;
        assert s_RD1 = C_VALOR_3 report "ERRO RD1! Leitura do REG 5 falhou." severity error;
        
        report "Sucesso!";
        wait; 
    end process STIMULUS_PROCESS;

end architecture;