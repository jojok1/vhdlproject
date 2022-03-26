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
           seven : out STD_LOGIC_VECTOR (6 downto 0);
           db : out STD_LOGIC);
         
end project;

architecture Behavioral of project is

--constant max_count : integer := 6250000;  --From practical 9. lets user pick clockspeed.
constant max_count : integer := 5;  
constant sseg : integer := 1;
--constant sseg : integer := 1250000;

signal clk : std_logic;
signal sev_clk: std_logic;

begin

clk_divide : process (clk_in) is
  
  variable count : unsigned(22 downto 0):= to_unsigned(0,23);
  variable seg_count : unsigned(22 downto 0):= to_unsigned(0,23);                                                          -- required to count up to 6,250,000!
  variable clk_int : std_logic := '0';  
  variable clk_sev : std_logic := '0';                        -- this is a clock internal to the process
  
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
    
    if rising_edge(clk_in) then
      
      if seg_count < sseg-1 then     -- highest value count should reach is 6,249,999.
        seg_count := seg_count + 1;           -- increment counter
      else
        seg_count := to_unsigned(0,23);   -- reset count to zero
        clk_sev := not clk_sev;       -- invert clock variable every time counter resets
      end if;
      
      sev_clk <= clk_sev;                 -- assign clock variable to internal clock signal
      
    end if;
    
    
  end process;
  
  
  sequence_generator : process (clk) is

  variable count : unsigned(3 downto 0) := "0000";
  
  variable button : unsigned(1 downto 0) := "00";
  
  begin
  
    db <= '0';
  
    if rising_edge(clk) then
        
        if (reset = '1') then
        
            count := "0000";
            
            
         elsif (enable = '1') then
            
            count := count + 1;
          
          end if;
          
       end if;
       
       
      if (bday1 = '1') then
           
          button := "01";
          
      elsif (bday2 = '1') then
       
         button := "10";
         
      elsif  (bday3 = '1') then
      
        button := "11";
        
      else 
      
       button := "00";
      
      end if;
      
      case to_integer(button) is
      
        when 1 => --pavlos led
        
            case to_integer(count) is 
        
                when 0 =>
    
                 led <= "1111110011111111";
        
                when 1 =>
        
     
                    led <= "1000000001100001";
  
                 when 2 =>
        
      
                    led <= "0000111100110000";
  
                when 3=>
                
                    led <= "0001100110011000";
   
                when 4=>
                
                    led <= "0011001100001100";
   
                when 5=>
                
                    led <= "0110000000011110";
   
                when 6=>
                
                    led <= "1100001100000011"; 
                
                when 7=>
                
                    led <= "1010000000001101"; 
                  
                when 8=>
                
                    led <= "1101000000011010";

                when 9=>
                
                    led <= "0010100000110100";
                
                when 10=>
                
                    led <= "0111010000101000"; 
                 
                when 11=>
                
                    led <= "0000111001010000";
                
                when 12=>
                
                    led <= "0000010110110000";
                
                when 13=>
                
                    led <= "0000011111000000";
                
                when 14=>
                
                    led <= "0000000110000000";
                
                when 15=>
                
                    led <= "0000011110100000";
   
                when others =>
      
                    led <= (others => '1');   
                
                end case;
                
         when 2 =>
                
                case to_integer(count) is 
    
                 when 0 =>
    
                 led <= "1000000000000001";
        
                when 1 =>
        
     
                led <= "0100000000000010";
  
                 when 2 =>
        
      
                 led <= "0010000000000100";
  
                when 3=>
                
                led <= "0001000000001000";
   
                when 4=>
                led <= "0000100000010000";
   
                when 5=>
                led <= "0000010000100000";
   
                when 6=>
                led <= "0000001001000000"; 
                when 7=>
                led <= "0000000110000000";   
                when 8=>
                led <= "0000011001100000";    
                when 9=>
                led <= "0001100000011000";
                when 10=>
                led <= "0110000000000110";  
                when 11=>
                led <= "1000000000000001";
                when 12=>
                led <= "0100000000000010";
                when 13=>
                led <= "0010000000000100";
                when 14=>
                led <= "0100000000000010";
                when 15=>
                led <= "1000000000000001";
   
                when others =>
           
                --count := "0000";
                led <= (others => '0');
                
                end case;
            
           when 3 =>
                    
                  case to_integer(count) is 
    
                               when 0 =>
    
                 led <= "1000000000000000";
        
                when 1 =>
        
     
                led <= "0000000000000001";
  
                 when 2 =>
        
      
                 led <= "0000000000000010";
  
                when 3=>
                
                led <= "0000000000000100";
   
                when 4=>
                led <= "0000000000001000";
   
                when 5=>
                led <= "0000000000010000";
   
                when 6=>
                led <= "0000000000100000"; 
                when 7=>
                led <= "0000000001000000";   
                when 8=>
                led <= "0000000010000000";    
                when 9=>
                led <= "0000000100000000";
                when 10=>
                led <= "0000001000000000";  
                when 11=>
                led <= "0000010000000000";
                when 12=>
                led <= "0000100000000000";
                when 13=>
                led <= "0001000000000000";
                when 14=>
                led <= "0010000000000000";
                when 15=>
                led <= "0100000000000000";
                 
                  when others =>
           
                --count := "0000";
               led <= (others => '0');
                   
                end case;   
                        
                           
           when others =>
           
                --count := "0000";
               led <= (others => '0');
                           
           end case;
             
   end process;
   
   
   sevenseg : process (sev_clk) is
   
    variable count : unsigned(3 downto 0) := "0000";
  
    variable button : unsigned(1 downto 0) := "00";
     
    begin
     
     if rising_edge(sev_clk) then
     
        count := count + 1;
        
     end if;
     
     
      if (bday1 = '1') then
           
          button := "01";
          
      elsif (bday2 = '1') then
       
         button := "10";
         
      elsif  (bday3 = '1') then
      
        button := "11";
        
      else 
      
       button := "00";
      
      end if;
       
       
       
        
     case to_integer(button) is
      
      when 1 =>
      
        case to_integer(count) is 
                 when 0=> 
                    anode<="0111";
                    seven<="0010010";
                 when 1=> 
                    anode<="1011";
                    seven<="0000100";
                when 2=> 
                    anode<="1101";
                    seven<="1001111";
                when 3=> 
                    anode<="1110";
                    seven<="1001111";
                 when 4=> 
                    anode<="0111";
                    seven<="0010010";
                 when 5=> 
                    anode<="1011";
                    seven<="0000100";
                when 6=> 
                    anode<="1101";
                    seven<="1001111";
                when 7=> 
                    anode<="1110";
                    seven<="1001111";
                 when 8=> 
                    anode<="0111";
                    seven<="0010010";
                 when 9=> 
                    anode<="1011";
                    seven<="0000100";
                when 10=> 
                    anode<="1101";
                    seven<="1001111";
                when 11=> 
                    anode<="1110";
                    seven<="1001111";
                 when 12=> 
                    anode<="0111";
                    seven<="0010010";
                 when 13=> 
                    anode<="1011";
                    seven<="0000100";
                when 14=> 
                    anode<="1101";
                    seven<="1001111";
                when 15=> 
                    anode<="1110";
                    seven<="1001111";
                when others=>
                    anode<="1111";
                    seven<="1111111";
                end case;
      
      when 2 =>
      
        case to_integer(count) is 
                when 0=> 
                    anode<="0111";
                    seven<="0010010";
                when 1=> 
                    anode<="1011";
                    seven<="0000001";
                when 2=> 
                    anode<="1101";
                    seven<="0000001";
                when 3=> 
                    anode<="1110";
                    seven<="1001111";
                 when 4=> 
                    anode<="0111";
                    seven<="0010010";
                 when 5=> 
                    anode<="1011";
                    seven<="0000100";
                when 6=> 
                    anode<="1101";
                    seven<="1001111";
                when 7=> 
                    anode<="1110";
                    seven<="1001111";
                    when 8=> 
                    anode<="0111";
                    seven<="0010010";
                 when 9=> 
                    anode<="1011";
                    seven<="0000100";
                when 10=> 
                    anode<="1101";
                    seven<="1001111";
                when 11=> 
                    anode<="1110";
                    seven<="1001111";
                    when 12=> 
                    anode<="0111";
                    seven<="0010010";
                 when 13=> 
                    anode<="1011";
                    seven<="0000100";
                when 14=> 
                    anode<="1101";
                    seven<="1001111";
                when 15=> 
                    anode<="1110";
                    seven<="1001111";
                when others=>
                    anode<="1111";
                    seven<="1111111";
     
                end case;
                
       when 3 =>
       
        case to_integer(count) is 
                when 0=> 
                    anode<="0111";
                    seven<="0000001";
                when 1=> 
                    anode<="1011";
                    seven<="0000110";
                 when 2=> 
                   anode<="1101";
                   seven<="0000001";
                when 3=> 
                    anode<="1110";
                    seven<="0000110";
                 when 4=> 
                    anode<="0111";
                    seven<="0000001";
                when 5=> 
                    anode<="1011";
                    seven<="0000110";
                 when 6=> 
                   anode<="1101";
                   seven<="0000001";
                when 7=> 
                    anode<="1110";
                    seven<="0000110";
                when 8=> 
                    anode<="0111";
                    seven<="0000001";
                when 9=> 
                    anode<="1011";
                    seven<="0000110";
                 when 10=> 
                   anode<="1101";
                   seven<="0000001";
                when 11=> 
                    anode<="1110";
                    seven<="0000110";
                 when 12=> 
                    anode<="0111";
                    seven<="0000001";
                when 13=> 
                    anode<="1011";
                    seven<="0000110";
                 when 14=> 
                   anode<="1101";
                   seven<="0000001";
                when 15=> 
                    anode<="1110";
                    seven<="0000110";
               when others => 
                    anode<="1111";
                    seven<="1111111";
               end case;
                    
               
                
                
       when others =>
       
          anode <= "1111";
          seven <= "1111111";
          
   end case;
   
   end process;
   
   
   
   
   
   
   
   end Behavioral;          