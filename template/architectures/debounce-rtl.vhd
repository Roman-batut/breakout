architecture rtl of debounce is
  signal s_q1, s_q2, s_q3, s_q4, s_edge_detect, s_clear, s_reset, s_a, s_b, s_c : std_logic;

  component timer is
    generic (count : integer := debounce_count);
      port (
      clk   : in std_logic;
      n_reset : in std_logic;
      reset : in std_logic;
      flag : out std_logic
    );
  end component;

begin

  timer_inst : timer
  generic map(count => debounce_count)
  port map (
    clk => clk,
    n_reset => n_reset,
    reset => s_reset,
    flag => s_clear
  );

  timer_ctrl : process (clk, n_reset)
  begin
    if n_reset = '0' then
       s_reset <= '1';
    elsif rising_edge(clk) then
      if s_edge_detect = '1' then
        s_reset <= '0';
      end if;
      if s_clear = '1' then
        s_reset <= '1';
      end if;
    end if;
  end process;

  button_out <= s_q4;

  s_edge_detect <= s_a;

  s_a <= s_q2 and not s_q3;

  s_b <= s_a or s_q4;

  s_c <= button_in and not s_clear;

  dff1 : process (clk, n_reset) is
  begin
    if n_reset = '0' then
      s_q1 <= '0';
    elsif rising_edge(clk) then
      s_q1 <= s_c;
    end if;
  end process dff1;

  dff2 : process (clk, n_reset) is
  begin
    if n_reset = '0' then
      s_q2 <= '0';
    elsif rising_edge(clk) then
      s_q2 <= s_q1 and not s_clear;
    end if;
  end process dff2;

  dff3 : process (clk, n_reset) is
  begin
    if n_reset = '0' then
      s_q3 <= '0';
    elsif rising_edge(clk) then
      s_q3 <= s_q2 and not s_clear;
    end if;
  end process dff3;

  dff4 : process (clk, n_reset) is
  begin
    if n_reset = '0' then
      s_q4 <= '0';
    elsif rising_edge(clk) then
      s_q4 <= s_b and not s_clear;
    end if;
  end process dff4;

end rtl;