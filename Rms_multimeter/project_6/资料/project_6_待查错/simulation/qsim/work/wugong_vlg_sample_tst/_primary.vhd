library verilog;
use verilog.vl_types.all;
entity wugong_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        shizai          : in     vl_logic_vector(17 downto 0);
        yougong         : in     vl_logic_vector(17 downto 0);
        sampler_tx      : out    vl_logic
    );
end wugong_vlg_sample_tst;
