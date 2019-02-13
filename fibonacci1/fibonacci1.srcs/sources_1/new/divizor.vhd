library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_bit.ALL;

entity divizor is
 Port (
   clk100Mhz : in bit;
   clk : out bit_vector(1 downto 0)
 );
end divizor;

architecture Behavioral of divizor is

    signal counter: unsigned(19 downto 0);
    signal cnt_temp: bit_vector(19 downto 0);

begin
    process(clk100Mhz)
    begin
        if(clk100Mhz = '1' and clk100Mhz'event) then
            counter <= counter + 1;
        end if;
    end process;
    cnt_temp <= bit_vector(counter);
    clk <= cnt_temp(19 downto 18);

end Behavioral;
