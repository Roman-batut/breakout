ARCHITECTURE rtl OF paddle IS
signal paddle_loc : std_logic_vector(3 downto 0) := "0101";
BEGIN

-- Paddle location
paddle_loc_x <= paddle_loc;

control : process (clk, n_reset)
begin
    if rising_edge(clk) then

        -- Reset
        if n_reset = '0' then
            
            paddle_loc <= "0101";

        elsif game_ctl = '1' then

            -- Right shift
            if but_right = '1' and to_integer(signed(paddle_loc)) < 8 then
                paddle_loc <= to_integer(signed(paddle_loc)) + 1;
            end if;

            -- Left shift
            if but_left = '1' and to_integer(signed(paddle_loc)) > 3 then
                paddle_loc <= to_integer(signed(paddle_loc)) - 1;
            end if;

        end if;
            
    end if;
end process;

END rtl;