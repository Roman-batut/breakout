ARCHITECTURE rtl OF game_ctl IS
signal play_without_bricks : std_logic;

type state_type is (play, end_stop, idle_stop);
    signal s_state : state_type := idle_stop;
BEGIN

game : process(clk, n_reset)
begin

    if n_reset = '0' then
        s_state <= idle_stop;
    elsif rising_edge(clk) then
        case s_state is

            -- Idle Stop State
            when idle_stop =>
                if (but_left = '1') or (but_right = '1') then
                    s_state <= play;
                end if;

                -- Can play without bricks
                if brick_loc_valid = "0000" then
                    play_without_bricks <= '1';
                else
                    play_without_bricks <= '0';
                end if;

            -- Play State
            when play =>
                if (ball_loc_invalid = '1') or ((brick_loc_valid = "0000") and play_without_bricks = '0') then
                    s_state <= end_stop;
                end if;
            
            -- End Stop State
            when (others => s_state <= s_state;) 
        end case;
    end if;

end process;

game_ctl_out <= '1' when s_state = play else '0';
    
END rtl;