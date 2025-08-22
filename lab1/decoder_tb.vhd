library ieee;
use ieee.std_logic_1164.all;
-- uma entidade é definida por arquivo
entity decoder_tb is
end;

architecture decoder3x8_tb of decoder_tb is
	component decoder
 		port( 
			in0, in1, in2 : in std_logic;
 			out0,  out1, out2, out3, out4, out5, out6, out7 : out std_logic
	 	);
	end component;
	signal s_in0, s_in1, s_in2, s_out0, s_out1, s_out2, s_out3, s_out4, s_out5, s_out6, s_out7 : std_logic;
begin
 -- uut significa Unit Under Test
	uut: decoder port map( 
				in0 => s_in0,
				in1 => s_in1,
				in2 => s_in2,
				out0 => s_out0,
				out1 => s_out1,
				out2 => s_out2,
				out3 => s_out3,
				out4 => s_out4,
				out5 => s_out5,
				out6 => s_out6,
				out7 => s_out7
	);
	process
 	begin
 		s_in0 <= '0';
 		s_in1 <= '0';
 		s_in2 <= '0';
 		wait for 50 ns;
		s_in0 <= '1';
 		s_in1 <= '0';
 		s_in2 <= '0';
 		wait for 50 ns;
		s_in0 <= '0';
 		s_in1 <= '1';
 		s_in2 <= '0';
 		wait for 50 ns;
		s_in0 <= '1';
 		s_in1 <= '1';
 		s_in2 <= '0';
		wait for 50 ns;
		s_in0 <= '0';
 		s_in1 <= '0';
 		s_in2 <= '1';
 		wait for 50 ns;
 		s_in0 <= '1';
 		s_in1 <= '0';
 		s_in2 <= '1';
 		wait for 50 ns;
 		s_in0 <= '0';
 		s_in1 <= '1';
 		s_in2 <= '1';
 		wait for 50 ns;
 		s_in0 <= '1';
 		s_in1 <= '1';
 		s_in2 <= '1';
 		wait for 50 ns;
		wait;
 	end process;
end architecture;
