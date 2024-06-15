library verilog;
use verilog.vl_types.all;
entity shizaigonglv_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        i_youxiaozhi    : in     vl_logic_vector(13 downto 0);
        u_youxiaozhi    : in     vl_logic_vector(13 downto 0);
        sampler_tx      : out    vl_logic
    );
end shizaigonglv_vlg_sample_tst;
