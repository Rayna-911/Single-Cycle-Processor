library ieee;
use ieee.std_logic_1164.all;
use  work.eecs361_gates.all;

entity PC_30bit is
  port (
	clk	   : in  std_logic;
	--arst   : in  std_logic; --we ignore reset  to 0 for reset all bits 0
	aload  : in  std_logic; --we reset as initialize for initialize with the address of first instruction in program 
  --adata  : in  std_logic; --initialization value with address of first instruction in program,default in side
  d	     : in  std_logic_vector(29 downto 0);
  start  : in  std_logic; --start runing the program
  q	     : out std_logic_vector(29 downto 0)
  );
end PC_30bit;

architecture structural of PC_30bit is
  component dffr_a is
  port (
	clk	   : in  std_logic;
  arst   : in  std_logic;
  aload  : in  std_logic;
  adata  : in  std_logic;
	d	     : in  std_logic;
  enable : in  std_logic;
	q	     : out std_logic
	);
  end component;
  signal arst        :std_logic;   
  signal init_address: std_logic_vector(29 downto 0);
  begin
     arst <='0';
     init_address <= "000000000100000000000000001000";--initialize address
     Bit29_map: dffr_a port map  (clk,arst,aload,init_address(29),d(29),start,q(29));
     Bit28_map: dffr_a port map  (clk,arst,aload,init_address(28),d(28),start,q(28));
     Bit27_map: dffr_a port map  (clk,arst,aload,init_address(27),d(27),start,q(27));
     Bit26_map: dffr_a port map  (clk,arst,aload,init_address(26),d(26),start,q(26));
     Bit25_map: dffr_a port map  (clk,arst,aload,init_address(25),d(25),start,q(25));
     
     Bit24_map: dffr_a port map  (clk,arst,aload,init_address(24),d(24),start,q(24)); 
   
     Bit23_map: dffr_a port map  (clk,arst,aload,init_address(23),d(23),start,q(23));
     Bit22_map: dffr_a port map  (clk,arst,aload,init_address(22),d(22),start,q(22));
     Bit21_map: dffr_a port map  (clk,arst,aload,init_address(21),d(21),start,q(21));
     Bit20_map: dffr_a port map  (clk,arst,aload,init_address(20),d(20),start,q(20));
     Bit19_map: dffr_a port map  (clk,arst,aload,init_address(19),d(19),start,q(19));
     Bit18_map: dffr_a port map  (clk,arst,aload,init_address(18),d(18),start,q(18));  
     Bit17_map: dffr_a port map  (clk,arst,aload,init_address(17),d(17),start,q(17));
     Bit16_map: dffr_a port map  (clk,arst,aload,init_address(16),d(16),start,q(16));
     Bit15_map: dffr_a port map  (clk,arst,aload,init_address(15),d(15),start,q(15));
     Bit14_map: dffr_a port map  (clk,arst,aload,init_address(14),d(14),start,q(14));
     Bit13_map: dffr_a port map  (clk,arst,aload,init_address(13),d(13),start,q(13));
     Bit12_map: dffr_a port map  (clk,arst,aload,init_address(12),d(12),start,q(12));  
     Bit11_map: dffr_a port map  (clk,arst,aload,init_address(11),d(11),start,q(11));
     Bit10_map: dffr_a port map  (clk,arst,aload,init_address(10),d(10),start,q(10));
     Bit9_map : dffr_a port map  (clk,arst,aload,init_address(9), d(9) ,start,q(9));
     Bit8_map : dffr_a port map  (clk,arst,aload,init_address(8), d(8) ,start,q(8));  
     Bit7_map : dffr_a port map  (clk,arst,aload,init_address(7), d(7) ,start,q(7));
     Bit6_map : dffr_a port map  (clk,arst,aload,init_address(6), d(6) ,start,q(6));
     Bit5_map : dffr_a port map  (clk,arst,aload,init_address(5), d(5) ,start,q(5));
     Bit4_map : dffr_a port map  (clk,arst,aload,init_address(4), d(4) ,start,q(4));
     Bit3_map : dffr_a port map  (clk,arst,aload,init_address(3), d(3) ,start,q(3));
     Bit2_map : dffr_a port map  (clk,arst,aload,init_address(2), d(2) ,start,q(2));  
     Bit1_map : dffr_a port map  (clk,arst,aload,init_address(1), d(1) ,start,q(1));
     Bit0_map : dffr_a port map  (clk,arst,aload,init_address(0), d(0) ,start,q(0)); 
       
end structural;
