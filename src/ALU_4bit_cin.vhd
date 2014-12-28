library ieee;
use ieee.std_logic_1164.all;
use  work.eecs361_gates.all;


entity ALU_4bit_cin is
  port (
    x       : in  std_logic_vector(3 downto  0);
    y       : in  std_logic_vector(3 downto  0);
    M       : in  std_logic_vector(1 downto 0);--control  signal
    cin     : in  std_logic;
    Result  : out std_logic_vector(3 downto  0);
    cout    : out std_logic;
    overflow:out std_logic 
  );
end ALU_4bit_cin;

architecture structural of ALU_4bit_cin is 
component ALU_1bit_cin is
port (
    x      : in  std_logic;
    y      : in  std_logic;
    M      : in  std_logic_vector(1 downto 0);--control  signal
    cin    : in  std_logic;
    Result : out std_logic;
    cout   : out std_logic 
  );
end component ALU_1bit_cin;  
component FullAdder_1bit is
  port (
    x   : in  std_logic;
    y   : in  std_logic;
    cin : in  std_logic;
    sum : out std_logic;
    cout: out std_logic 
  );
end component FullAdder_1bit;
component mux_4to1 is
  port (
	option00 :in	std_logic;
	option01 :in	std_logic;
	option10 :in	std_logic;
	option11 :in	std_logic;
	selector :in	std_logic_vector(1 downto 0);
	selection:out std_logic
  );
end component mux_4to1;

signal cin1,cin2,cin3,cin4: std_logic;  

begin
   --ALU0~ALU3
   ALU_0_map :   ALU_1bit_cin port map  (x => x(0), y => y(0), M => M, cin => cin,  Result => result(0),cout => cin1) ; --cout is used for next cin. 
   ALU_1_map :   ALU_1bit_cin port map  (x => x(1), y => y(1), M => M, cin => cin1, Result => result(1),cout => cin2) ; --cout is used for next cin.
   ALU_2_map :   ALU_1bit_cin port map  (x => x(2), y => y(2), M => M, cin => cin2, Result => result(2),cout => cin3) ; --cout is used for next cin. 
   ALU_3_map :   ALU_1bit_cin port map  (x => x(3), y => y(3), M => M, cin => cin3, Result => result(3),cout => cin4) ; --cout is used for next cin.
   cout <= cin4;
   --overflow  output
   overflow_map  :  xor_gate port map (x => cin3,y => cin4,z => overflow);
end structural;
