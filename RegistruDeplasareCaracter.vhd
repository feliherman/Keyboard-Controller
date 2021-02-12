library ieee;
use ieee.std_logic_1164.all;

entity RegistruDeplasareCaracter is
	port(Si:in  std_logic_vector(0 to 6);
	Clk:in std_logic;
	Reset:in std_logic;	  --RESET ESTE ENTER
	A,B,C,D:out std_logic_vector(0 to 6));
end entity ;

architecture A_RegistruDeplasareCaracter  of RegistruDeplasareCaracter is
begin	   
	
	process(Clk,Reset)
	variable I0,I1,I2,I3:std_logic_vector( 0 to 6):= "1111111";	
	begin 
			 --se evita resetarea cand nu se activeaza enter
		if(Reset  = '1' AND Si/="0111111" and Si/="1111010" and I0/="0010000" and  I0/="0000010" and  I0/= "1001111" and I0/= "0011000" and I0/="1100010" and I0/="0110100" and I0/="0010000" and Si/="0011000" and I0/="0000001" and I0/="1110001" and  I0/="1111001" and  I0/="1111000") then 
			
	I0:="1111111";																			
	I1:="1111111";
	I2:="1111111";	
	I3:="1111111";	
			  --caracterele nu se deplaseaza la apasarea sagetilor sau a tastei CapsLock
		elsif(Clk = '1' and Clk'event and Si/="1110111" and Si/="0111111" and Si/="1110111" ) then 	  		
			
	I3:=I2;
	I2:=I1;
	I1:=I0;	
	I0:=Si;

	end if;

	A<=I0;
	B<=I1;
	C<=I2;
	D<=I3;
			
	end process;
end architecture ;



