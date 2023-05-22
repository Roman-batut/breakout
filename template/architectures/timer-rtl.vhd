architecture rtl of timer is
  signal counter : integer := 0;

begin

  timer : process (clk, reset)
  begin

    if n_reset = '0' then

      counter <= 0;

    elsif rising_edge(clk) then

      counter <= counter + 1;

      if counter = count - 1 or reset = '1' then

        counter <= 0;

      end if;
    end if;
  end process;

  flag <= '1' when counter = count - 1 else '0';

end rtl;