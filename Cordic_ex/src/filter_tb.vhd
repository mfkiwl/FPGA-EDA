library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_signed.all;

entity filter_tb is
end;

architecture bench of filter_tb is
    -- clock period
    constant clk_period : time := 5 ns;
    -- generics
    -- ports
    signal clk : std_logic := '1';
    signal clk_enable : std_logic := '1';
    signal reset : std_logic := '1';
    signal filter_in : std_logic_vector(15 downto 0);
    signal filter_out : std_logic_vector(34 downto 0);
    signal filter_dequan : std_logic_vector(16 downto 0);
    file text_in : text;
    file text_out : text;
    signal init_rd : std_logic := '0';
    signal init_wr : std_logic := '0';

    type status_type is (idle, file_open,write_begin, file_close );
    signal wr_status:status_type:=idle;
    signal rd_status:status_type:=idle;

begin

    filter_dequan <= filter_out(34 downto 18);

    filter_inst : entity work.filter
        port map(
            clk => clk,
            clk_enable => clk_enable,
            reset => reset,
            filter_in => filter_in,
            filter_out => filter_out
        );
    clk <= not clk after clk_period/2;

    process
    begin
        reset <= '1';
        wait for clk_period * 10;
        reset <= '0';
        wait;
    end process;
        
    data_in : process (clk)
        variable line_in : line;
        variable data_in : std_logic_vector(15 downto 0);
    begin
        if (reset = '1' and init_rd = '0') then
            file_open(text_in, "./../src/fir_signal_data_gen.txt", read_mode);
            report "open";
            init_rd <= '1';
        elsif (not endfile(text_in)) then
            if(clk'event and clk = '1') then
                if (clk_enable = '1') then
                    readline(text_in, line_in);
                    read(line_in, data_in);
                end if;
            end if;
        -- else 
        --     file_close(text_in);  
        end if;

        filter_in <= data_in;
    end process;

    -- data_out_1 : process (clk)
    --     variable line_in : line;
    --     variable data_in : std_logic_vector(16 downto 0);
    -- begin
    --     if (reset = '1' and init_wr = '0') then
    --         file_open(text_out, "./../src/fpga_fir_data.txt", write_mode);
    --         file_close(text_out);
    --         file_open(text_out, "./../src/fpga_fir_data.txt", append_mode);
    --         init_wr <= '1';
    --     elsif (not endfile(text_in)) then
    --         if(clk'event and clk = '1') then
    --             data_in := filter_dequan;
    --             write(line_in, data_in);
    --             writeline(text_out, line_in);
    --         end if;
    --     else 
    --         report "wr_close";
    --         file_close(text_out);
    --     end if;
    -- end process;

    data_out_2 : process (clk)
        variable line_in : line;
        variable data_in : std_logic_vector(16 downto 0);
    begin
        if clk'event and clk = '1' then
            case (wr_status)is
                when idle => if init_rd = '0' then
                        wr_status <= idle;
                    else
                        wr_status <= file_open;
                        end if;
                when file_open => wr_status <= write_begin;
                        report "wr_open";
                        file_open(text_out, "./../src/fpga_fir_data.txt", write_mode);
                        file_close(text_out);
                        file_open(text_out, "./../src/fpga_fir_data.txt", append_mode);
                when write_begin => data_in := filter_dequan;
                        report "wr_begin";
                        write(line_in, data_in);
                        writeline(text_out, line_in);
                        if (endfile(text_in)) then
                            wr_status <= file_close;
                            report "wr_close";
                        else
                            wr_status <= write_begin;
                        end if;
                when file_close => file_close(text_out);
                when others => wr_status <= idle;
            end case;
        end if;        
    end process;

end;