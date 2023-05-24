ARCHITECTURE rtl OF display IS

BEGIN

display : process (clk, n_reset)
begin
    if rising_edge(clk) then
        -- Bricks

        -- 0
        led_array(coord_to_ind(brick_loc_x_arr(0), brick_loc_y_arr(0))) <= '1';
        led_array(coord_to_ind(to_integer(signed(brick_loc_x_arr(0))) + 1, to_integer(signed(brick_loc_y_arr(0))))) <= '1';

        -- 1
        led_array(coord_to_ind(brick_loc_x_arr(1), brick_loc_y_arr(1))) <= '1';
        led_array(coord_to_ind(to_integer(signed(brick_loc_x_arr(1))) + 1, to_integer(signed(brick_loc_y_arr(1))))) <= '1';

        -- 2
        led_array(coord_to_ind(brick_loc_x_arr(2), brick_loc_y_arr(2))) <= '1';
        led_array(coord_to_ind(to_integer(signed(brick_loc_x_arr(2))) + 1, to_integer(signed(brick_loc_y_arr(2))))) <= '1';

        -- 3
        led_array(coord_to_ind(brick_loc_x_arr(3), brick_loc_y_arr(3))) <= '1';
        led_array(coord_to_ind(to_integer(signed(brick_loc_x_arr(3))) + 1, to_integer(signed(brick_loc_y_arr(3))))) <= '1';

        -- Walls

        -- Upper wall
        led_array(coord_to_ind(0, 8)) <= '1';
        led_array(coord_to_ind(1, 8)) <= '1';
        led_array(coord_to_ind(2, 8)) <= '1';
        led_array(coord_to_ind(3, 8)) <= '1';
        led_array(coord_to_ind(4, 8)) <= '1';
        led_array(coord_to_ind(5, 8)) <= '1';
        led_array(coord_to_ind(6, 8)) <= '1';
        led_array(coord_to_ind(7, 8)) <= '1';
        led_array(coord_to_ind(8, 8)) <= '1';
        led_array(coord_to_ind(9, 8)) <= '1';
        led_array(coord_to_ind(10, 8)) <= '1';
        led_array(coord_to_ind(11, 8)) <= '1';

        -- Left wall
        led_array(coord_to_ind(0, 0)) <= '1';
        led_array(coord_to_ind(0, 1)) <= '1';
        led_array(coord_to_ind(0, 2)) <= '1';
        led_array(coord_to_ind(0, 3)) <= '1';
        led_array(coord_to_ind(0, 4)) <= '1';
        led_array(coord_to_ind(0, 5)) <= '1';
        led_array(coord_to_ind(0, 6)) <= '1';
        led_array(coord_to_ind(0, 7)) <= '1';

        -- Right wall
        led_array(coord_to_ind(11, 0)) <= '1';
        led_array(coord_to_ind(11, 1)) <= '1';
        led_array(coord_to_ind(11, 2)) <= '1';
        led_array(coord_to_ind(11, 3)) <= '1';
        led_array(coord_to_ind(11, 4)) <= '1';
        led_array(coord_to_ind(11, 5)) <= '1';
        led_array(coord_to_ind(11, 6)) <= '1';
        led_array(coord_to_ind(11, 7)) <= '1';

        -- Lower wall
        led_array(coord_to_ind(1, 0)) <= '1';
        led_array(coord_to_ind(10, 0)) <= '1';

        -- Ball

        led_array(coord_to_ind(ball_loc_x, ball_loc_y)) <= '1';

        -- Paddle

        led_array(coord_to_ind(paddle_loc_x, paddle_loc_y)) <= '1';
        led_array(coord_to_ind(to_integer(signed(paddle_loc_x)) + 1, to_integer(signed(paddle_loc_y)))) <= '1';
        led_array(coord_to_ind(to_integer(signed(paddle_loc_x)) + 2, to_integer(signed(paddle_loc_y)))) <= '1';

    end if;
end process; 
   
END rtl;