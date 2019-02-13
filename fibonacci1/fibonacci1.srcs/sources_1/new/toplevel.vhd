library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity toplevel is
    Port (
            clk: in bit;
            reset : in std_logic;
            secventa : in std_logic_vector(7 downto 0);
            seg : out std_logic_vector(6 downto 0);
            AN : out std_logic_vector(7 downto 0);
            overflow : out std_logic
         );
end toplevel;

architecture Behavioral of toplevel is

    component fibonacci is
            Port (
                   index : in std_logic_vector(7 downto 0);
                   fib_n : out std_logic_vector(15 downto 0);
                   overflow : out std_logic
                   );
    end component fibonacci;

    component myzcb is
        Port (
              input : in std_logic_vector(15 downto 0);
              clk : in bit_vector(1 downto 0);
              seg : out std_logic_vector(6 downto 0);
              AN : out std_logic_vector(7 downto 0)
              );
    end component myzcb;
     
     component  divizor is
                        Port (
                                clk100Mhz : in bit;
                                clk : out bit_vector(1 downto 0)
                               );
     end component divizor;
     
     signal new_clk : bit_vector(1 downto 0);
     signal rez : std_logic_vector(15 downto 0);
     
begin

    ceas: divizor port map ( clk100Mhz => clk, clk => new_clk);
    fib: fibonacci port map (index => secventa, fib_n => rez, overflow => overflow );
    display: myzcb port map(input => rez, clk => new_clk, seg => seg, AN => AN);    

end Behavioral;
