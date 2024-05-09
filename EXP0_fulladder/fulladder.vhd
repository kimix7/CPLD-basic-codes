library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity fulladder is
 port (A, B, Cin: in std_logic; S, Cout: out std_logic);
end entity fulladder;
architecture struct of fulladder is
 signal tC, tS, V: std_logic;
 begin
  --component instances
  ha: Half_Adder
       port map (A =>A, B=>B, S=>tS, C=> tC);
		 
  --propogate carry
	a1: AND_2 port map (A => tS, B => Cin, Y => V);
	o1: OR_2 port map (A => V, B => tC, Y => Cout);

  --final sum
	x1: XOR_2 port map (A => tS, B => Cin, Y => S);
end struct;