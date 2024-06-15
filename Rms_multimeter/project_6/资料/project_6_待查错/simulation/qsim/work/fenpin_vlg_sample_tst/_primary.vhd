library verilog;
use verilog.vl_types.all;
entity fenpin_vlg_sample_tst is
    port(
        clk_24M         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end fenpin_vlg_sample_tst;
