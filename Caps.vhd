library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Caps is  
	port(CodHexa:in std_logic_vector(0 to 10);
		C:out std_logic);
end entity; 	

architecture A_Caps of Caps is  
begin 

	process(CodHexa)
	variable a:std_logic:='0';
	begin	
	if( CodHexa="00101100001" )then
	 a:=(a xor '1');
	end if;
		C<= a; 
end process;   
end architecture;



