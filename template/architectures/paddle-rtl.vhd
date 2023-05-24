ARCHITECTURE rtl OF paddle IS
signal paddle_loc : integer := 5;
BEGIN

-- Paddle location
paddle_loc_x <= std_logic_vector(to_unsigned(paddle_loc, 4));

control : process (clk, n_reset)
begin
    if rising_edge(clk) then

        -- Reset
        if n_reset = '0' then
            
            paddle_loc <= 5;

        elsif game_ctl = '1' then

            -- Left shift
            if but_left = '1' then
                if paddle_loc > 3 then
                    paddle_loc <= paddle_loc - 1;
                end if;
            end if;

            -- Right shift
            if but_right = '1' then
                if paddle_loc < 8 then
                    paddle_loc <= paddle_loc + 1;
                end if;
            end if;

        end if;
            
    end if;
end process;

END rtl;