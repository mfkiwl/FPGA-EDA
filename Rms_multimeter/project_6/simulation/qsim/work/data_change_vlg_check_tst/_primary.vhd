library verilog;
use verilog.vl_types.all;
entity data_change_vlg_check_tst is
    port(
        dout0           : in     vl_logic_vector(4 downto 0);
        dout1           : in     vl_logic_vector(4 downto 0);
        dout2           : in     vl_logic_vector(4 downto 0);
        dout3           : in     vl_logic_vector(4 downto 0);
        dout4           : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end data_change_vlg_check_tst;
