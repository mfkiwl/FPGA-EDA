library verilog;
use verilog.vl_types.all;
entity shizaigonglv_vlg_check_tst is
    port(
        shizaigonglv    : in     vl_logic_vector(17 downto 0);
        sampler_rx      : in     vl_logic
    );
end shizaigonglv_vlg_check_tst;
