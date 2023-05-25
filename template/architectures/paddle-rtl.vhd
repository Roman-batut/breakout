ARCHITECTURE rtl OF paddle IS
signal paddle_loc : integer := 5;
BEGIN

-- Paddle location
paddle_loc_x <= std_logic_vector(to_unsigned(paddle_loc, 4));

control : process (clk, n_reset)
begin
    -- Reset
    if n_reset = '0' then
        
        paddle_loc <= 5;

    elsif rising_edge(clk) then

        if game_ctl = '1' then

            -- No shift
            if but_left = '1' and but_right = '1' then
                paddle_loc <= paddle_loc;

            -- Left shift
            elsif but_left = '1' and paddle_loc > 3 then
                paddle_loc <= paddle_loc - 1;

            -- Right shift
            elsif but_right = '1' and paddle_loc < 8 then
                paddle_loc <= paddle_loc + 1;
            end if;

        end if;
            
    end if;
end process;

END rtl;