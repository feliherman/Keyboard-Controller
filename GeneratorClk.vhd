library ieee;
use ieee.std_logic_1164.all;

entity GeneratorClk is
	port( Cod:in std_logic_vector(0 to 10);	--cei 11 biti de la preluare
	Clk:in std_logic;
	ClkOut:out std_logic); 
end entity;

architecture A_GeneratorClk of GeneratorClk is
begin
	 
	process(Clk,Cod)
	variable  I1:integer := -1; -- -1 pt ca avem nevoie de o iteratie in plus mai jos
	variable  I2:std_logic := '0';
	begin
	   
		if( Clk='1' and Clk'event) then 
			I1 := I1+1;
			if ( I1=32 and I2='0') then	   
				
				I2:='1';
				I1:=0;	  
				
			elsif (Cod="01110000001") then --CARACTER SPECIAL	  0_E0_01	 
				
				I1:= I1-11;	  
				
			elsif I2='1' then 
				
				I2:='0';
				I1:=0;	  
				
			end if;
		end if;
		
	ClkOut<= I2;  			
		
	end process;

end architecture;