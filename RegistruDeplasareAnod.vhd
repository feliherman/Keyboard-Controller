library ieee;
use ieee.std_logic_1164.all;

entity RegistruDeplasareAnod is
	port(Clk:in std_logic;	--este vorba de clk divizat!!!!
	Iesire:out std_logic_vector(0 to 3));
end entity ;

architecture A_RegistruDeplasareAnod of RegistruDeplasareAnod is

begin	   
	
	process(Clk)
	variable Intermediar:std_logic_vector( 0 to 3):= "1110";	 
	variable I0: std_logic;
	begin 
		
	if (Clk='1' and Clk'event) then 	
		I0 := Intermediar(0);
		Intermediar(0):=Intermediar(1);
		Intermediar(1):=Intermediar(2);
		Intermediar(2):=Intermediar(3);
		Intermediar(3):=I0;	
	end if;
	
	Iesire <= Intermediar;
	
	end process;
end architecture ;