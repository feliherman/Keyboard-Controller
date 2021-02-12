library ieee;
use ieee.std_logic_1164.all;

entity RegistruPrelucrare  is
	port ( Intrare: in std_logic_vector(0 to 10);
	Iesire: out std_logic_vector(0 to 7);
	Led:out std_logic);
end entity;

architecture A_RegistruPrelucrare of RegistruPrelucrare is   
begin
	
	process(Intrare)
	
	variable a:std_logic:='1'; 
	variable b:std_logic:='1'; 
	
	begin
  -- intrare de 2 prima pentru ca sunt primiti secventential si sunt cititi invers
	a:=Intrare(2) XOR Intrare(3) XOR Intrare(4) XOR Intrare(5) XOR Intrare(6) XOR Intrare(7) XOR Intrare(8) XOR Intrare(9) XOR '1' ;
	
		
		if (Intrare(10)='0' and Intrare(0)='1'  and  a= Intrare(1))
			then b:='0'; 
		else
			null;
        end if;	 
		
	Led<=b;		  	
	end process;  
--asa asignam iesirilor codurile care ne intereseaza din cei 11 biti trimisi 
	Iesire(7)<=Intrare(9);
	Iesire(6)<=Intrare(8);
	Iesire(5)<=Intrare(7); 
	Iesire(4)<=Intrare(6);
	Iesire(3)<=Intrare(5);
	Iesire(2)<=Intrare(4); 
	Iesire(1)<=Intrare(3); 
	Iesire(0)<=Intrare(2);

end architecture;