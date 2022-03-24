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
use IEEE.numeric_std.all;


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

clk_divide : process (clk_in) is
  
  variable count : unsigned(22 downto 0):= to_unsigned(0,23);   -- required to count up to 6,250,000!
  variable clk_int : std_logic := '0';                          -- this is a clock internal to the process
  
  begin
    
    if rising_edge(clk_in) then
      
      if count < max_count-1 then     -- highest value count should reach is 6,249,999.
        count := count + 1;           -- increment counter
      else
        count := to_unsigned(0,23);   -- reset count to zero
        clk_int := not clk_int;       -- invert clock variable every time counter resets
      end if;
      
      clk <= clk_int;                 -- assign clock variable to internal clock signal
      
    end if;
    
  end process;
  
  
  sequence_generator : process (clk) is

  variable count : unsigned(3 downto 0) := "0000";
  
  
  begin
  
    if rising_edge(clk) then
        
        if (reset = '1') then
        
            count := "0000";
            
         elsif (enable = '1') then
            
            count := count + 1;
            
          end if;
          
       end if;
       
       
      if (bday1 = '1') then
      
            case to_integer(count) is 
        
                when 0 =>
    
                    led <= "0000001111000000";
        
                when 1 =>
        
                    led <= "0000011001100000";
  
                when others =>
      
                    led <= (others => '1');   
                
                end case;
                
         elsif (bday2 = '1') then
         
                   case to_integer(count) is 
    
                        when 0 =>
    
                            led <= "1111001111001111";
        
                        when 1 =>
        
                             led <= "1100011001100011";
  
                        when others =>
      
                              led <= (others => '1');  
        
                        end case;
            
           elsif (bday3 = '1') then
           
                    case to_integer(count) is 
    
                         when 0 =>
    
                            led <= "1111111111111111";
        
                          when 1 =>
        
                            led <= "0010011111100100";
  
                           when others =>
      
                               led <= (others => '1');   -- set all LEDs to ON if anything unexpected happens!
        
                           end case;
                           
           end if;
             
   end process;
   
   
   end Behavioral;          

            
       























