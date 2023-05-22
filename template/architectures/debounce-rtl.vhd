architecture rtl of debounce is
  signal s_q1, s_q2, s_q3, s_q4 : std_logic;
begin

  dff1 : process (clk)
  begin
    if rising_edge(clk) then
      s_q1 <= button_in and not n_reset;
    end if;
  end process dff1;

  dff2 : process (clk)
  begin
    if rising_edge(clk) then
      s_q2 <= s_q1 and not n_reset;
    end if;
  end process dff2;

  dff3 : process (clk)
  begin
    if rising_edge(clk) then
      s_q3 <= s_q2 and not n_reset;
    end if;
  end process dff3;

  dff4 : process (clk)
  begin
    if rising_edge(clk) then
      s_q4 <= ((s_q2 and not s_q3) or s_q4) and not n_reset;
    end if;
  end process dff4;

  button_out <= s_q4;

end rtl;