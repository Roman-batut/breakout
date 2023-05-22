library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is
  generic (count : integer := 8);
  port (
    clk : in std_logic;
    n_reset : in std_logic;
    reset : in std_logic;
    flag : out std_logic);
end timer;