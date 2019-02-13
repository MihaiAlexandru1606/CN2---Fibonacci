----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2018 23:13:11
-- Design Name: 
-- Module Name: myzcb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity myzcb is
    Port (
          input : in std_logic_vector(15 downto 0);
          clk : in bit_vector(1 downto 0);
          seg : out std_logic_vector(6 downto 0);
          AN : out std_logic_vector(7 downto 0)
           );
end myzcb;

architecture Behavioral of myzcb is

    component zcb is
                    Port (
                           x: in STD_LOGIC_VECTOR(3 downto 0);
                           seg: out STD_LOGIC_VECTOR(6 downto 0)
                           );
     end component zcb;

    signal A, B, C, D :std_logic_vector(6 downto 0);
    
begin
    
    comp1: zcb port map (x => input(3 downto 0), seg => A);
    comp2: zcb port map (x => input(7 downto 4), seg => B);
    comp3: zcb port map (x => input(11 downto 8), seg => C);
    comp4: zcb port map (x => input(15 downto 12), seg => D);  
    
    with clk select seg <=
        A when "00",
        B when "01",
        C when "10",
        D when "11";
    
    with clk select AN <=
        "11111110" when "00",
        "11111101" when "01",
        "11111011" when "10",
        "11110111" when "11";    

end Behavioral;
