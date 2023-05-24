ARCHITECTURE rtl OF paddle IS
BEGIN

control : process (clk, n_reset)
begin
    if rising_edge(clk) then

        -- Reset
        if n_reset = '0' then
            
            paddle_loc_x <= "0101";

        elsif game_ctl = '1' then

            -- Right shift
            if but_right = '1' and to_integer(signed(paddle_loc_x)) < 8 then
                paddle_loc_x <= paddle_loc_x + 1;
            end if;

            -- Left shift
            if but_left = '1' and to_integer(signed(paddle_loc_x)) > 3 then
                paddle_loc_x <= paddle_loc_x - 1;
            end if;

        end if;
            
    end if;
end process;
    
end process;


END rtl;