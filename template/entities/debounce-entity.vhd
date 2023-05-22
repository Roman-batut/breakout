library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.utils.all;

entity debounce is
  port (
    clk : in std_logic;
    n_reset : in std_logic;
    button_in : in std_logic;
    button_out : out std_logic);
end debounce;