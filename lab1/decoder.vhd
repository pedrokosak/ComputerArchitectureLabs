library ieee;
use ieee.std_logic_1164.all;

entity decoder is
	port( 
		in0, in1, in2 : in std_logic;
 		out0,  out1, out2, out3, out4, out5, out6, out7 : out std_logic
 	);
end entity;

architecture decoder3x8 of decoder is
begin
	process(in0, in1, in2)
	begin
		out0 <= not in0 and not in1 and not in2;
		out1 <= in0 and not in1 and not in2;
		out2 <= not in0 and in1 and not in2;
		out3 <= in0 and in1 and not in2;
		out4 <= not in0 and not in1 and in2;
		out5 <= in0 and not in1 and in2;
		out6 <= not in0 and in1 and in2;
		out7 <= in0 and in1 and in2;
	end process;
end architecture;

