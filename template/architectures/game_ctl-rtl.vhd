ARCHITECTURE rtl OF game_ctl IS
signal play_without_bricks, s_brk_invalid : std_logic := '0';

type state_type is (play, end_stop, idle_stop);
    signal s_state, s_next_state : state_type := idle_stop;
BEGIN

game_ctl_out <= '1' when (s_state = play and (not(s_next_state = end_stop)) ) else '0';

-- Invalid Bricks
bricks : process (brick_loc_valid)
begin 

    s_brk_invalid <= '0';

    if brick_loc_valid = "0000" then
        s_brk_invalid <= '1';
    end if;

end process;

-- State Switch
game : process (clk, n_reset, s_state, s_next_state)
begin

    if n_reset = '0' then
        s_state <= idle_stop;
    elsif rising_edge(clk) then
        s_state <= s_next_state;
    end if;
    
end process;

-- Next State Logic
next_state : process(n_reset, s_state, but_left, but_right, ball_loc_invalid, s_brk_invalid, play_without_bricks, brick_loc_valid)
begin

    -- Reset
    if n_reset = '0' then
        s_next_state <= idle_stop;

    -- Idle Stop
    elsif s_state = idle_stop then
        
        -- Can play without bricks
        if brick_loc_valid = "0000" then
            play_without_bricks <= '1';
        else
            play_without_bricks <= '0';
        end if;

        if (but_left = '1') or (but_right = '1') then
            s_next_state <= play;
        end if;
    
    -- Play
    elsif s_state = play then
        if (ball_loc_invalid = '1') or (s_brk_invalid = '1' and play_without_bricks = '0') then
            s_next_state <= end_stop;
        end if;
    end if;

end process;

END rtl;