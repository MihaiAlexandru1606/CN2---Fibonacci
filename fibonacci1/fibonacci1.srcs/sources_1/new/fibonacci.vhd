----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2018 19:08:29
-- Design Name: 
-- Module Name: fibonacci - Behavioral
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

entity fibonacci is
    Port (
            index : in std_logic_vector(7 downto 0);
            fib_n : out std_logic_vector(15 downto 0);
            overflow : out std_logic
          );
end fibonacci;

architecture Behavioral of fibonacci is

    component bcdToBinary is
        Port (
                bcd : in std_logic_vector(7 downto 0);
                binary: out integer
               );
    end component bcdToBinary;

    type lut is array (natural range 0 to 20) of std_logic_vector(15 downto 0);
    constant my_lut : lut := (
        "0000000000000000", "0000000000000001", "0000000000000001", "0000000000000010", "0000000000000011",
        "0000000000000101", "0000000000001000", "0000000000010011", "0000000000100001", "0000000000110100",
        "0000000001010101", "0000000010001001", "0000000101000100", "0000001000110011", "0000001101110111",
        "0000011000010000", "0000100110000111", "0001010110010111", "0010010110000100", "0100000110000100",
        "0110011101100101"                      
                              );
     
    signal i : integer := 0;
                              
begin
    
    conv: bcdToBinary port map(bcd => index, binary => i);
    fib_n <= my_lut(i) when ( (i < 21) and (i >= 0) )  else
            "1001100110011001";
    overflow <= '0' when  ( (i < 21) and (i >=  0) ) else
                 '1';

end Behavioral;
