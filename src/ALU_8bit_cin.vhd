library ieee;
use ieee.std_logic_1164.all;
use  work.eecs361_gates.all;
use  work.eecs361.mux_n;
use  work.eecs361.mux;

entity ALU_8bit_cin is
  port (
    x       : in  std_logic_vector(7 downto 0);
    y       : in  std_logic_vector(7 downto 0);
    M       : in  std_logic_vector(1 downto 0);--control  signal
    cin     : in  std_logic;
    Result  : out std_logic_vector(7 downto 0);
    cout    : out std_logic;
    overflow: out std_logic
  );
end ALU_8bit_cin;

architecture structural of ALU_8bit_cin is 

component ALU_4bit_cin is
  port (
    x       : in  std_logic_vector(3 downto  0);
    y       : in  std_logic_vector(3 downto  0);
    M       : in  std_logic_vector(1 downto 0);--control  signal
    cin     : in  std_logic;
    Result  : out std_logic_vector(3 downto  0);
    cout    : out std_logic;
    overflow:out std_logic 
  );
end component ALU_4bit_cin;

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

signal Result0,Result1: std_logic_vector(3 downto 0);  
signal cout0,cout1,sel,overflow0,overflow1,overflow2:  std_logic;
begin
   --ALU [7:4],  Cin=0
   ALUupper0_map   :  ALU_4bit_cin port map ( x => x(7 downto 4), y => y(7 downto 4), M => M, cin => '0', Result => Result0, cout => cout0, overflow  => overflow0);
   --ALU [7:4],  Cin=1
   ALUupper1_map   :  ALU_4bit_cin port map ( x => x(7 downto 4), y => y(7 downto 4), M => M, cin => '1', Result => Result1, cout => cout1, overflow  => overflow1);
   --ALU [3:0],  Cin=cin=M(0)=cout
   ALUlower_map    :  ALU_4bit_cin port map ( x => x(3 downto 0), y => y(3 downto 0), M => M, cin => cin, Result => Result(3  downto 0), cout => sel, overflow  => overflow2);
   --cout select
   cout_mux_map    :  mux port map (sel => sel, src0 => cout0, src1 => cout1, z  => cout);
   --overflow select
   overflow_mux_map:  mux port map (sel => sel, src0 => overflow0, src1 => overflow1, z  => overflow);
   --Result upper selection   
   mux_map         :  mux_n generic map (n => 4) port map ( sel => sel, src0 => Result0,  src1 => Result1, z => Result(7 downto 4));
   
end structural;

