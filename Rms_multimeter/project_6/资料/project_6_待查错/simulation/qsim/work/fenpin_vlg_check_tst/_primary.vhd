library verilog;
use verilog.vl_types.all;
entity fenpin_vlg_check_tst is
    port(
        new_clk_8K      : in     vl_logic;
        new_clk_24M     : in     vl_logic;
        new_clk_80k     : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end fenpin_vlg_check_tst;
