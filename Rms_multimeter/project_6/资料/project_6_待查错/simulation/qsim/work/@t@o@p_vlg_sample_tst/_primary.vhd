library verilog;
use verilog.vl_types.all;
entity TOP_vlg_sample_tst is
    port(
        clk24M          : in     vl_logic;
        eoc1            : in     vl_logic;
        eoc2            : in     vl_logic;
        key             : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end TOP_vlg_sample_tst;
