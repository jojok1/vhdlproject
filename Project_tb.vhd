----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2022 14:35:34
-- Design Name: 
-- Module Name: Project_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Project_tb is
--  Port ( );
end Project_tb;

architecture Behavioral of Project_tb is

component project is
    Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           bday1 : in STD_LOGIC;
           bday2 : in STD_LOGIC;
           bday3 : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (15 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0);
           seven : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal clk_in, reset, enable, bday1, bday2, bday3 : std_logic;
signal led : std_logic_vector(15 downto 0);
signal anode : STD_LOGIC_VECTOR (3 downto 0);
signal seven : STD_LOGIC_VECTOR (6 downto 0);

-- clock period - actual clock input is 100MHz (see just above the "Basys 3" logo on the board)
constant T_clk : time := 10 ns;
-- divided clock period (useful for specifying stimulus - short periods between changes)
constant sim_clk : time := 5 * T_clk;

-- number of clock cycles to simulate
constant n_cycles : integer := 10000;


begin
    
    test : project
    port map(
      clk_in => clk_in,
      reset  => reset,
      enable => enable,
      bday1 => bday1,
      bday2 => bday2,
      bday3 => bday3,
      led   => led,
      anode => anode,
      seven => seven);
      
    stimulus : process is

begin


        reset <= '1'; enable <= '1'; bday1 <= '0'; bday2 <= '0'; bday3 <= '0'; wait for 8*sim_clk;
         
        reset <= '0'; enable <= '1'; bday1 <= '1'; bday2 <= '0'; bday3 <= '0'; wait for 8*sim_clk;

        reset <= '0'; enable <= '1'; bday1 <= '0'; bday2 <= '1'; bday3 <= '0'; wait for 8*sim_clk;

        reset <= '0'; enable <= '1'; bday1 <= '0'; bday2 <= '0'; bday3 <= '0'; wait for 8*sim_clk;
        
        reset <= '0'; enable <= '1'; bday1 <= '0'; bday2 <= '0'; bday3 <= '1'; wait for 16*sim_clk;


end process;


clk_gen : process is
   
   begin
     
     while now <= (n_cycles*sim_clk) loop       
       
         clk_in <= '1'; wait for T_clk/2;
         clk_in <= '0'; wait for T_clk/2;
         
       end loop;
	
	wait;
       
   end process;







end Behavioral;
