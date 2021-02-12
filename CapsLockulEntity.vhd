library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;	 

entity nrcaps is  
port(codehexa:in std_logic_vector(0 to 10);
first:out std_logic);
end nrcaps; 	

architecture anrcaps of nrcaps is 
  signal a:std_logic:='0'; 
  signal t:std_logic; 
begin 

	process(codehexa)
	
	begin	
	if( codehexa="00101100001" )then
	 a<=a xor '1';
	end if;
	
		first<= a; 
end process;   


end anrcaps;
