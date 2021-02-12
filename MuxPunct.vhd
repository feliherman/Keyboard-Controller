library ieee;
use ieee.std_logic_1164.all;  

entity MuxPunct is
	port(A:in std_logic_vector(0 to 3);
	Sel:in std_logic_vector(0 to 1);
	Iesire:out std_logic);
end entity;

architecture A_MuxPunct of MuxPunct is

begin
	process(A,Sel)   
		  variable Intermediar :std_logic;
	begin
		if Sel="00" then
			 Intermediar := A(0);
		elsif Sel="01" then
			 Intermediar := A(1);
		elsif Sel="10" then	
			 Intermediar := A(2);
		elsif Sel="11" then 
		   Intermediar := A(3);
		end if;	 
		
		Iesire<= Intermediar;
		
	end process;
end architecture;