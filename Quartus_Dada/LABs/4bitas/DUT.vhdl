-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(8 downto 0);
       	output_vector: out std_logic_vector(4 downto 0));
end entity;

architecture DutWrap of DUT is
   component fourbitas is
		port(a, b: in std_logic_vector(3 downto 0);
			m:in std_logic;
			s: out std_logic_vector(3 downto 0);
			cout: out std_logic
			);
	end component fourbitas;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: fourbitas 
			port map (
					-- order of inputs B A
					a(3) => input_vector(8),
					a(2) => input_vector(7),
					a(1) => input_vector(6),
					a(0) => input_vector(5),
					b(3) => input_vector(4),
					b(2) => input_vector(3),
					b(1) => input_vector(2),
					b(0) => input_vector(1),
					m => input_vector(0),
               -- order of output OUTPUT
					cout => output_vector(4),
					s(3) => output_vector(3),
					s(2) => output_vector(2),
					s(1) => output_vector(1),
					s(0) => output_vector(0));
end DutWrap;