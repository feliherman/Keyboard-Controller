library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Numarator is
	port(Clk:in std_logic; --este vorba de clk divizat!!!
	Iesire:out std_logic_vector(0 to 1));
end entity;

architecture A_Numarator of Numarator is

begin
	
	process(Clk)
		variable Count:std_logic_vector(0 to 1):="00";
	begin
		if(Clk ='1' and Clk'event) then   
			Count := Count + '1';
		end if;
	Iesire <= Count;
	end process;
end architecture;
			