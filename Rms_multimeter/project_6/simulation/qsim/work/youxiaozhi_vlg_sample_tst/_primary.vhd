library verilog;
use verilog.vl_types.all;
entity youxiaozhi_vlg_sample_tst is
    port(
        clk8k           : in     vl_logic;
        clk648          : in     vl_logic;
        din             : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end youxiaozhi_vlg_sample_tst;
