library ieee;
use ieee.std_logic_1164.all;
use  work.eecs361_gates.all;
use  work.eecs361.mux_n;
use  work.eecs361.mux;
use  work.eecs361.mux_32;

entity ALU_32bit is
  port (
    ctrl  : in std_logic_vector(3 downto 0);
    A     : in std_logic_vector(31 downto 0);
    B     : in std_logic_vector(31 downto 0);
    cout  : out std_logic;  -- ?1? -> carry out
    ovf : out std_logic;  -- ?1? -> overflow
    ze    : out std_logic;  -- ?1? -> is zero
    R     : out std_logic_vector(31 downto 0)--; -- result
    --sltu_test   : out  std_logic
  );
end ALU_32bit;

architecture structural of ALU_32bit is 

component ALU_8bit_cin is
  port (
    x       : in  std_logic_vector(7 downto 0);
    y       : in  std_logic_vector(7 downto 0);
    M       : in  std_logic_vector(1 downto 0);--control  signal
    cin     : in  std_logic;
    Result  : out std_logic_vector(7 downto 0);
    cout    : out std_logic;
    overflow: out std_logic
  );
end component ALU_8bit_cin;

component shift_left_32bit is
  port (
    A     : in  std_logic_vector(31 downto 0);--operand
    B     : in  std_logic_vector(31 downto 0);--shift offset 000000~100000
    R     : out std_logic_vector(31 downto 0) -- result
  );
end component  shift_left_32bit;
component mux_4to1_32bit is
  port (
	sel    : in  std_logic_vector(1 downto 0);
	src00  : in  std_logic_vector(31 downto 0);
	src01  : in  std_logic_vector(31 downto 0);
	src10  : in  std_logic_vector(31 downto 0);
	src11  : in  std_logic_vector(31 downto 0);
	z	    : out std_logic_vector(31 downto 0)
  );
end component mux_4to1_32bit;

signal cout0,cout1,cout2: std_logic;
signal Result_addlogic,Result_sll,Result_inter1,result_null,result_slt,result_sltu,Result: std_logic_vector(31 downto 0); 
signal or1          : std_logic_vector(15 downto 0);
signal or2          : std_logic_vector(7  downto 0);
signal or3          : std_logic_vector(3  downto 0);
signal or4          : std_logic_vector(1  downto 0);
signal or5         : std_logic; 
signal overflow0,overflow1,overflow2,overflow3:std_logic;

signal carryout     : std_logic;--bridge  to get the final cout


signal slt_sel,sltu_sel: std_logic;
begin
   --zero
   --Output ze
   or1_map   : or_gate_n generic map(n => 16)
                         port map   (x => Result  (31 downto 16), y =>  Result(15 downto 0),z => or1);
   or2_map   : or_gate_n generic map(n => 8)
                         port map   (x => or1(15 downto 8) , y => or1(7 downto 0),z => or2);
   or3_map   : or_gate_n generic map(n => 4)
                         port map   (x => or2(7 downto 4)  , y => or2(3 downto 0),z => or3);
   or4_map   : or_gate_n generic map(n => 2)
                         port map   (x => or3(3 downto 2)  , y => or3(1 downto 0),z => or4);                        
   or5_map   : or_gate   port map   (x => or4(1)  , y => or4(0),z => or5);
   zero_map  : not_gate  port map   (x => or5, z => ze);
   
   --shift
   --**Function:sll (0100) 
   shift_left_map     :  shift_left_32bit port map ( A => A, B => B, R =>  Result_sll);
   
   --ALU
   --**Function:add (0000) sub (0001) and(0010) or (0011)
   --ALU [7:0],  Cin=ctrl(0)
   ALU7to0_map        :  ALU_8bit_cin     port map ( x => A(7 downto 0)  , y => B(7 downto 0)  , M => ctrl(1 downto 0), cin => ctrl(0), Result => Result_addlogic(7 downto 0), cout => cout0 ,overflow =>overflow0);
   --ALU [15:8], Cin=cout0
   ALU15to8_map       :  ALU_8bit_cin     port map ( x => A(15 downto 8) , y => B(15 downto 8) , M => ctrl(1 downto 0), cin => cout0  , Result => Result_addlogic(15 downto 8), cout => cout1 ,overflow =>overflow1);
   --ALU [23:16], Cin=cout1
   ALU23to16_map      :  ALU_8bit_cin     port map ( x => A(23 downto 16), y => B(23 downto 16), M => ctrl(1 downto 0), cin => cout1  , Result => Result_addlogic(23 downto 16), cout => cout2,overflow =>overflow2);
   --ALU [32:24], Cin=cout2
   --Output cout
   ALU32to24_map      :  ALU_8bit_cin     port map ( x => A(31 downto 24), y => B(31 downto 24), M => ctrl(1 downto 0), cin => cout2  , Result => Result_addlogic(31 downto 24), cout => carryout ,overflow =>overflow3); 
   cout  <= carryout;
   ovf <= overflow3;
   --slt overflow xor notcout
   --**Function:slt(0101)
   --not_cout_map       :  not_gate         port map( x => carryout, z => sltu_sel);
   --sltu_test <= sltu_sel;
   slt_sel_map        :  xor_gate         port map (x  => Result_addlogic(31), y  =>overflow3, z  => slt_sel);
   slt_map            :  mux_32           port map ( sel => slt_sel, src0 => "00000000000000000000000000000000" , src1 => "00000000000000000000000000000001", z => result_slt);   
  
   --sltu not(cout)
  
 --**Function:sltu (0111)!!!!!!!!!!!!!!!
   --sltu_sel         :  not_gate          port map( x => carryout, z => sltu_sel);
   --sltu_map         :  mux_32            port map( sel => sltu_sel, src0 => "00000000000000000000000000000000" , src1 => "00000000000000000000000000000001", z => result_sltu);   
   sltu_map           :  mux_32            port map( sel => carryout, src0 => "00000000000000000000000000000001" , src1 => "00000000000000000000000000000000", z => result_sltu);   

   --selection among sll:0100  slt:0101 sltu:0111
   shift_selection_map: mux_4to1_32bit    port map ( ctrl(1 downto 0),Result_sll, result_slt, result_null,  result_sltu,  Result_inter1);
   --final selection
   --Output R
   operation_sel_map  : mux_32            port map (sel => ctrl(2), src0 => Result_addlogic, src1 => Result_inter1, z	=> Result);
  
   R <= Result;
end structural;


