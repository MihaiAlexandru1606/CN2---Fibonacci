----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2018 16:48:18
-- Design Name: 
-- Module Name: bcdToBinary - Behavioral
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
USE ieee.numeric_std.ALL;

entity bcdToBinary is
    Port (
            bcd : in std_logic_vector(7 downto 0);
            binary: out integer
           );
end bcdToBinary;

architecture Behavioral of bcdToBinary is

    component cla8bit is
        Port ( 
                a    : in std_logic_vector(7 downto 0);
                b    : in std_logic_vector(7 downto 0);
                cin  : in std_logic;
                sum  : out std_logic_vector(7 downto 0);
                cout : out std_logic
               );
    end component cla8bit;

    signal sum1 : std_logic_vector(7 downto 0);
    signal sum2 : std_logic_vector(7 downto 0);
    signal fistDigit : std_logic_vector(3 downto 0);
    signal secondDigit : std_logic_vector(3 downto 0);
    
begin

    add1: cla8bit port map (
                            a(7 downto 4) => "0000",
                            a(3 downto 0) => fistDigit,
                            b(7) => '0',
                            b(6 downto 3) => secondDigit,
                            b(2 downto 0) => "000",
                            cin => '0',
                            sum => sum1,
                            cout => open 
                           );
                           
                           
    add2: cla8bit port map(
                            a => sum1,
                            b(7 downto 5) => "000",
                            b(4 downto 1) => secondDigit,
                            b(0) => '0',
                            cin => '0',
                            sum => sum2,
                            cout => open
                           );
                           
      fistDigit <= bcd(3 downto 0) when (bcd(3 downto 0) < "1010" and bcd(7 downto 4) < "1010") else "1001";
      secondDigit <= bcd(7 downto 4) when (bcd(3 downto 0) < "1010" and bcd(7 downto 4) < "1010") else "1001";
                            
      binary <= to_integer(unsigned(sum2));
      
end Behavioral;
