library verilog;
use verilog.vl_types.all;
entity fenpin is
    port(
        clk_24M         : in     vl_logic;
        new_clk_8K      : out    vl_logic;
        new_clk_80k     : out    vl_logic;
        new_clk_24M     : out    vl_logic
    );
end fenpin;
