library ieee;
use ieee.std_logic_1164.all;

entity Tastatura is
	port( Clk50MHz,ClkTastatura:in std_logic;
	DataTastatura:in std_logic;
	Catod:out std_logic_vector(0 to 6);
	CatodPunct:out std_logic;
	Anod:out std_logic_vector(0 to 3);
	Eroare,CapsL:inout std_logic);
end entity;

architecture A_Tastatura of Tastatura is	

signal OutPreluare :std_logic_vector(0 to 10);
signal CodHexa:std_logic_vector(0 to 7);
signal ClkDivizat,Enter,ClkCaracterNou:std_logic;
signal CodDCD: std_logic_vector(0 to 6);
signal A: std_logic_vector( 0 to 6);		 
signal B: std_logic_vector( 0 to 6);
signal C : std_logic_vector( 0 to 6);
signal D: std_logic_vector( 0 to 6);	
signal SemnalNumarator:std_logic_vector(0 to 1);		
signal RegPunct:std_logic_vector(0 to 3);

component RegistruPreluare is
	port (Si: in  std_logic;
	Clk: in std_logic;
	Iesire: out std_logic_vector( 0 to 10));
end component;

component RegistruPrelucrare  is
	port ( Intrare: in std_logic_vector(0 to 10);
	Iesire: out std_logic_vector(0 to 7);
	Led:out std_logic);
end component;	

component Decoder is
	port(Cod:in std_logic;
	Intrare:in std_logic_vector(0 to 7);
	Iesire:out std_logic_vector(0 to 6));
end component;	 

component  Divizor is 
	port(Clk:in std_logic;
	Iesire:out std_logic);
end component;	

component  RegistruDeplasarePunct is
	port(A:in std_logic_vector(0 to 6);--corectare eroare	
	Reset: in std_logic;		 --Reset este enter
	CodHexa: in std_logic_vector( 0 to 7);
	Clk:in std_logic;
	Iesire: out std_logic_vector(0 to 3));

end component;		 

component RegistruDeplasareAnod is
	port(Clk:in std_logic;	--este vorba de clk divizat!!!!
	Iesire:out std_logic_vector(0 to 3));
	
end component;

component Mux is
	port(A,B,C,D:in std_logic_vector(0 to 6);
	Sel:in std_logic_vector(0 to 1);
	Iesire:out std_logic_vector(0 to 6));
end component;

component  MuxPunct is
	port(A:in std_logic_vector(0 to 3);
	Sel:in std_logic_vector(0 to 1);
	Iesire:out std_logic);
end component;	

component RegistruDeplasareCaracter is
	port(Si:in  std_logic_vector(0 to 6);
	Clk:in std_logic;
	Reset:in std_logic;	  --RESET ESTE ENTER
	A,B,C,D:out std_logic_vector(0 to 6));
end component;

component  Numarator is
	port(Clk:in std_logic; --este vorba de clk divizat!!!
	Iesire:out std_logic_vector(0 to 1));
end component;	  

component  GeneratorClk is
	port( Cod:in std_logic_vector(0 to 10);	--cei 11 biti de la preluare
	Clk:in std_logic;
	ClkOut:out std_logic); 
end component;

component Caps is  
	port(CodHexa:in std_logic_vector(0 to 10);
		C:out std_logic);
end component; 	
	


BEGIN

	Enter<=	NOT OutPreluare(10) and not OutPreluare(9) and OutPreluare(8) and  not OutPreluare(7) and  OutPreluare(6) and OutPreluare(5) and not OutPreluare(4) and OutPreluare(3) and not OutPreluare(2) and  OutPreluare(1) and   OutPreluare(0) ;
	-- 0_5A_11 = Enter
	
	
	V0:RegistruPreluare port map(DATATastatura,ClkTastatura,OutPreluare);
	
	I1:RegistruPrelucrare port map(OutPreluare,CodHexa,Eroare) ;	
	
	VCAPSLOCK:Caps port map(OutPreluare,CapsL);
	
  	V2:Decoder port map(CapsL,CodHexa,CodDCD) ;	  
	
	I4:GeneratorClk port map(OutPreluare,ClkTastatura,ClkCaracterNou); 
	  
	F5:RegistruDeplasareCaracter port map(CodDCD,ClkCaracterNou,Enter,A,B,C,D);   	
	
	E6:Divizor port map(Clk50MHz,ClkDivizat);
	
	L7:Numarator port map(ClkDivizat,SemnalNumarator);
	
	I8:Mux port map(A,B,C,D,SemnalNumarator,Catod); 
		
	B9:RegistruDeplasareAnod port map(ClkDivizat,Anod); 	 
	
	O10:RegistruDeplasarePunct port map(A,Enter,CodHexa,ClkCaracterNou,RegPunct);
	
	S11:MuxPunct port map(RegPunct,SemnalNumarator,CatodPunct); 
	
end architecture;