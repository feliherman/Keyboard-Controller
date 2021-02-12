library ieee;
use ieee.std_logic_1164.all;  

entity Mux is
	port(A,B,C,D:in std_logic_vector(0 to 6);
	Sel:in std_logic_vector(0 to 1);
	Iesire:out std_logic_vector(0 to 6));
end entity;

architecture A_Mux of Mux is

begin
	process(A,B,C,D,Sel)   
		  variable Intermediar :std_logic_vector(0 to 6);
	begin
		if Sel="00" then
			 Intermediar := A;
		elsif Sel="01" then
			 Intermediar := B;
		elsif Sel="10" then	
			 Intermediar := C;
		elsif Sel="11" then
		   Intermediar := D;
		end if;	 
		
		Iesire<= Intermediar;
		
	end process;
end architecture;