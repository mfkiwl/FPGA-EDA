library verilog;
use verilog.vl_types.all;
entity cnt60_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        data            : in     vl_logic_vector(5 downto 0);
        ld              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end cnt60_vlg_sample_tst;