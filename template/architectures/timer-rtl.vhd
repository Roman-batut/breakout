architecture rtl of timer is
  signal counter : unsigned(31 downto 0) := to_unsigned(count, 32);
begin

  timer : process (clk, reset)
  begin
    if rising_edge(clk) then

      if reset = '1' then
        counter <= to_unsigned(count, 32);
        flag <= '0';
      else counter <= counter - 1;
      end if;

      if counter = to_unsigned(0, 32) then
        flag <= '1';
      end if;

    end if;
  end process;

end rtl;