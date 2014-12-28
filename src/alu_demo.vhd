library ieee;
use ieee.std_logic_1164.all;

entity alu_1_demo is
port (
    cout: out std_logic;
 --   	 and1: out std_logic; 
--	     or1: out std_logic;
--	      mux21 : out std_logic;
--	      not1: out std_logic;
--	       nor1: out std_logic;
--	        adder1: out std_logic;
    R: out std_logic  
);
end alu_1_demo;

architecture structural of alu_1_demo is
component alu_1 is

port(
      ctrl_1 : in std_logic;
	    ctrl_0 : in std_logic;
	    c  : in std_logic;
	    A     : in std_logic;
	    B     : in std_logic;
	    cout  : out std_logic;  -- '1' -> carry out
	 --   of      : out std_logic;  -- '1' --> overflow
	 --and1: out std_logic; 
--	 or1: out std_logic;
--	  mux21 : out std_logic;
--	  not1: out std_logic;
--	   nor1: out std_logic;
--	    adder1: out std_logic;

	    R    : out std_logic   -- result
	   
	
);
end component alu_1;
signal ctrl_1in: std_logic;
signal ctrl_0in: std_logic;
signal cin: std_logic;
signal Ain: std_logic;
signal Bin: std_logic;
signal inbus: std_logic_vector(4 downto 0);

begin
    alu_1_map: alu_1 port map (
                               ctrl_1=>ctrl_1in,
                               ctrl_0=>ctrl_0in, 
                               c=>cin, 
                               A => Ain, 
                               B =>Bin,
                               cout => cout,
                          --  and1 => and1, 
--                            or1 => or1,
--                             mux21 => mux21,
--                             not1 => not1,
--                              nor1 => nor1,
--                               adder1=> adder1,
                               R => R

                                );
    ctrl_1in<=inbus(4); 
    ctrl_0in<=inbus(3);
    Ain<=inbus(2);
    Bin<=inbus(1);
    cin<=inbus(0);
    
    
    test_proc: process
    
    begin 
        inbus <="00000"; -- O and O = 0
        wait for 5 ns;
        inbus <="00010"; -- 0 and 1 = 0
        wait for 5 ns;
        inbus <="00100"; -- 1 and 0 =0
        wait for 5 ns;
        inbus <="00110"; -- 1 and 1 =1
        wait for 5 ns;
        
        inbus <="01000"; -- 0 or 0=0
        wait for 5 ns;
        inbus <="01010"; -- 0 or 1=1
        wait for 5 ns;
        inbus <="01100"; -- 1 or 0=1
        wait for 5 ns;
        inbus <="01110"; -- 1 or 1=1
        wait for 5 ns;
        
        inbus <="10000"; -- 0 add 0 with cin=0 R=> 0  cout=>0
        wait for 5 ns;
        inbus <="10010"; -- 1 add 0 with cin=0 R=> 1  cout=>0
        wait for 5 ns;
        inbus <="10100"; -- 0 add 1 with cin=0 R=> 1  cout=>0
        wait for 5 ns;
        inbus <="10110"; -- 1 add 1 with cin=0 R=> 0  cout=>1
        wait for 5 ns;
        
        inbus <="11001"; -- 0 add 0 with cin=1 R=> 1  cout=>0
        wait for 5 ns;
        inbus <="11011"; -- 1 add 0 with cin=1 R=> 0  cout=>1
        wait for 5 ns;
        inbus <="11101"; -- 0 add 1 with cin=1 R=> 0  cout=>1
        wait for 5 ns;
        inbus <="11111"; -- 1 add 1 with cin=1 R=> 1  cout=>1
        wait for 5 ns;
        
        
        
        wait;
    end process;
end architecture structural;
