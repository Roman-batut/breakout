ARCHITECTURE rtl OF brick IS
signal ball_next_loc_x, ball_next_loc_y : integer;
signal brk_loc_x, brk_loc_y : integer;
signal brk_loc_valid : std_logic := '1';
signal reseted : std_logic := '0';
BEGIN

-- Brick location
brk_loc_x <= to_integer(unsigned(loc_x));
brk_loc_y <= to_integer(unsigned(loc_y));


-- Ball location
ball_next_loc_x <= to_integer(unsigned(ball_loc_x)) + to_integer(unsigned(ball_vel_x));
ball_next_loc_y <= to_integer(unsigned(ball_loc_y)) + to_integer(unsigned(ball_vel_y));

brk : process (clk, n_reset, game_ctl, sync)
begin

    -- Reset
    if (n_reset = '0') then

        reseted <= '1';
        brk_loc_valid <= sw;

    -- Stop state
    elsif game_ctl = '0' and reseted = '1' then 
            
        brk_loc_valid <= sw;

    -- Rising edge
    elsif rising_edge(clk) and game_ctl = '1' then
        
        reseted <= '0';

        -- Collision
        if (brk_loc_valid = '1') and ((ball_next_loc_x = brk_loc_x) or (ball_next_loc_x = brk_loc_x + 1)) and (ball_next_loc_y = brk_loc_y) then

            brk_loc_valid <= '0';

        end if;

    end if;

    -- Sync
    if sync = '1' then

        brick_loc_x <= loc_x;
        brick_loc_y <= loc_y;
        brick_loc_valid <= brk_loc_valid;
        
    end if;
    
end process;

END rtl;