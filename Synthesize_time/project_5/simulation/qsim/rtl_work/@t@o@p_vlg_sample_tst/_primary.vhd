library verilog;
use verilog.vl_types.all;
entity TOP_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        key1            : in     vl_logic;
        key2            : in     vl_logic;
        key3            : in     vl_logic;
        key4            : in     vl_logic;
        key5            : in     vl_logic;
        key6            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end TOP_vlg_sample_tst;
