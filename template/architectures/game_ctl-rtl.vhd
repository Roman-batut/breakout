ARCHITECTURE rtl OF game_ctl IS
signal play_without_bricks : std_logic := '0';

type state_type is (play, end_stop, idle_stop);
    signal s_state, s_next_state : state_type := idle_stop;
BEGIN

game : process (clk, n_reset)
begin

    if n_reset = '0' then
        s_state <= idle_stop;
    elsif rising_edge(clk) then
        s_state <= s_next_state;
    end if;
    
end process;


next_state : process(clk, n_reset, s_state, but_left, but_right, ball_loc_invalid, brick_loc_valid, play_without_bricks)
begin

    if n_reset = '0' then
        s_state <= idle_stop;
    else 
        case s_state is

            -- Idle Stop State
            when idle_stop =>

                -- Can play without bricks
                if brick_loc_valid = "0000" then
                    play_without_bricks <= '1';
                else
                    play_without_bricks <= '0';
                end if;

                if (but_left = '1') or (but_right = '1') then
                    s_next_state <= play;
                end if;

            -- Play State
            when play =>
                if (ball_loc_invalid = '1') or ((brick_loc_valid = "0000") and play_without_bricks = '0') then
                    s_next_state <= end_stop;
                end if;
            
            -- End Stop State
            when others =>
                s_next_state <= idle_stop; 
        end case;
    end if;

end process;

game_ctl_out <= '1' when s_state = play else '0';
    
END rtl;