library ieee;
use ieee.std_logic_1164.all;		   

entity RegistruPreluare is
	port (Si: in  std_logic;
	Clk: in std_logic;
	Iesire: out std_logic_vector( 0 to 10));
end entity;

architecture A_RegistruPreluare of RegistruPreluare is	  
begin	  
	
	process	(Si,Clk)	   
	variable Intermediar: std_logic_vector(0 to 10):="00000000000" ;
	 begin
		if (Clk='0' and Clk'event) then 
			Intermediar(10):=Intermediar(9); 
			Intermediar(9):=Intermediar(8); 
			Intermediar(8):=Intermediar(7);
			Intermediar(7):=Intermediar(6); 
			Intermediar(6):=Intermediar(5);
			Intermediar(5):=Intermediar(4);
			Intermediar(4):=Intermediar(3); 
			Intermediar(3):=Intermediar(2); 
			Intermediar(2):=Intermediar(1); 
			Intermediar(1):=Intermediar(0); 
			Intermediar(0):=Si;
		end if;			  

		Iesire<=Intermediar;
	end process;
end architecture;











