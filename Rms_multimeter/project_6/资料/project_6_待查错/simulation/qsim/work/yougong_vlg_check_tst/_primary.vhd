library verilog;
use verilog.vl_types.all;
entity yougong_vlg_check_tst is
    port(
        dout            : in     vl_logic_vector(17 downto 0);
        sampler_rx      : in     vl_logic
    );
end yougong_vlg_check_tst;
