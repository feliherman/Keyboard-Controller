library ieee;
use ieee.std_logic_1164.all;

entity RegistruDeplasarePunct is
	port(A:in std_logic_vector(0 to 6);--corectare eroare	
	Reset: in std_logic;		 --Reset este enter
	CodHexa: in std_logic_vector( 0 to 7);
	Clk:in std_logic;
	Iesire: out std_logic_vector(0 to 3));	   
end entity ;

architecture A_RegistruDeplasarePunct of RegistruDeplasarePunct is	 
signal Intermediar:std_logic_vector(0 to 4):="11110";
begin
	process(Clk,CodHexa)
	
	variable Si:std_logic;
	begin	
		 --CODURI PT SAGETI 
	if(Reset = '1' and A/="0011000" and A/="1100010" and A/="0000001" and A/="0110100"  and A/="1110001" and  A/="1111000" and A/="1111001") then    
			Intermediar <= "11110";		 --
	
	elsif( Clk='1' and Clk'event) then		
	
		if(CodHexa ="01101011")then    	--shift left
			
			Si:=Intermediar(4);
			Intermediar(4)<= Intermediar(3);
			Intermediar(3)<= Intermediar(2);	
			Intermediar(2)<=Intermediar(1);
			Intermediar(1)<=Intermediar(0);	
			Intermediar(0)<=Si;	
			
	   elsif(CodHexa ="01110100") then   --shift right
		   
			Si:=Intermediar(0);
			Intermediar(0)<=Intermediar(1);
			Intermediar(1)<=Intermediar(2);
			Intermediar(2)<=Intermediar(3);
			Intermediar(3)<=Intermediar(4);
			Intermediar(4)<=Si;	  
			
	   end if;	  
	   
	end if;	  
					   
  Iesire <=Intermediar(0 to 3);	  --iesirea primeste doar bitii care next intereseaza pt cei 4 anozi ale punctelor
	end process;
end architecture;