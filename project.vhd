----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.03.2022 20:18:04
-- Design Name: 
-- Module Name: project - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity project is
    Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           bday1 : in STD_LOGIC;
           bday2 : in STD_LOGIC;
           bday3 : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (15 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0);
           seven : out STD_LOGIC_VECTOR (6 downto 0));
         
end project;

architecture Behavioral of project is

--constant max_count : integer := 6250000;  --From practical 9. lets user pick clockspeed.
constant max_count : integer := 5;  

signal clk : std_logic;

begin


end Behavioral;
