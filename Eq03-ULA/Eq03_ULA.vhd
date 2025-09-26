-- Pedro Henrique Kosak Ferreira 2090856
-- Davi Riiti Goto Do Valle 1908030
-- Raphael Leite Diniz 2358549
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is 
	port( 	
		in_A, in_B  	: in unsigned(15 downto 0);
		op 		: in unsigned(1 downto 0);
		out_ULA		: out unsigned(15 downto 0);
		zero, gt	: out std_logic  
	);
end entity;

architecture a_ULA of ULA is
	signal S_sum, S_sub, S_div, S_xor, S_out: unsigned(15 downto 0); 
begin
	S_sum <= in_A+in_B;
	S_sub <= in_A-in_B;
	S_div <= in_A/in_B;
	S_xor <= (in_A OR in_B) AND (NOT(in_A AND in_B));

	S_out <= S_sum when op="00" else
		 S_sub when op="01" else
		 S_div when op="10" else
		 S_xor when op="11" else
		 "0000000000000000";


	zero <=	 '1' when S_out ="0000000000000000" else
		 '0';

	gt <=	 '1' when in_A > in_B else
		 '0' when in_A <= in_B else
		 '0';

	out_ULA <= S_out;

end architecture;

	
