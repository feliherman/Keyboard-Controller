library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Divizor is 
	port(Clk:in std_logic;
	Iesire:out std_logic);
end entity;

architecture A_Divizor of Divizor is
begin
	
	process(Clk)
	variable CLK1:std_logic_vector(0 to 11):="000000000000";	
	begin
		if (Clk='1' and Clk'event) then 
			CLK1:= CLK1 + '1';
		else
			null;
		end if;
	Iesire<= CLK1(0); 
	end process;	  
	
end architecture;

		
		