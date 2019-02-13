----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2018 14:14:03
-- Design Name: 
-- Module Name: sim - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim is
--  Port ( );
end sim;

architecture Behavioral of sim is

    component fibonacci is
        Port (
                index : in std_logic_vector(7 downto 0);
                fib_n : out std_logic_vector(15 downto 0);
                overflow : out std_logic
              );
    end component fibonacci;
    
    signal index : std_logic_vector(7 downto 0);
    signal fib_n : std_logic_vector(15 downto 0);
    signal overflow : std_logic;

begin

    ceva: fibonacci port map (
                        index => index,
                        fib_n => fib_n,
                        overflow => overflow
                        );     

    sim: process
    begin
    
        for i in 0 to 99 loop
          wait for 10ns;
           index(3 downto 0) <= std_logic_vector(to_unsigned(i mod 10, 4));
           index(7 downto 4) <= std_logic_vector(to_unsigned((i / 10) mod 10, 4));
        end loop;
        --index <= "00011000";
        --wait for 200ns;
        --index <= "00011001";
        --wait for 200ns;
        --index <= "00100000";
        --wait for 200ns;
        --index <= "00100001";
        --wait for 200ns;
    end process;


end Behavioral;
