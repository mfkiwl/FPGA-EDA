library verilog;
use verilog.vl_types.all;
entity qiuhe_gong_vlg_sample_tst is
    port(
        clk8k           : in     vl_logic;
        din1            : in     vl_logic_vector(7 downto 0);
        din2            : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end qiuhe_gong_vlg_sample_tst;
