-- Pedro Henrique Kosak Ferreira 2090856
-- Davi Riiti Goto Do Valle 1908030
-- Raphael Leite Diniz 2358549
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA_tb is
end;

architecture a_ULA_tb of ULA_tb is
	component ULA 
		port( 	
			in_A, in_B  	: in unsigned(15 downto 0);
			op 		: in unsigned(1 downto 0);
			out_ULA		: out unsigned(15 downto 0);
			zero, gt	: out std_logic  
		);
	end component;
	signal s_in_A, s_in_B, s_out_ULA: unsigned(15 downto 0);
	signal s_op: unsigned(1 downto 0);
	signal s_zero, s_gt: std_logic;  
begin
 -- uut significa Unit Under Test
	uut: ULA port map( 
				in_A => s_in_A,
				in_B => s_in_B,
				op => s_op,
				out_ULA => s_out_ULA,
				zero => s_zero,
				gt => s_gt
			);
	process
 	begin
		s_in_A 	<= "0000000000000011";
		s_in_B 	<= "0000000000000011";
		s_op 	<= "00";
 		wait for 100 ns;
 		s_op 	<= "01";
 		wait for 100 ns;
		s_in_A 	<= "0101110000100001"; -- 23585d
		s_in_B 	<= "0100101010001000"; -- 19080d
 		s_op 	<= "10";
 		wait for 100 ns;
 		s_op <= "11";
 		wait for 100 ns;
		wait;
 	end process;
end architecture;
