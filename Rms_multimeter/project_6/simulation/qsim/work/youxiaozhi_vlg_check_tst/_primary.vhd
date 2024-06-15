library verilog;
use verilog.vl_types.all;
entity youxiaozhi_vlg_check_tst is
    port(
        dout            : in     vl_logic_vector(13 downto 0);
        sampler_rx      : in     vl_logic
    );
end youxiaozhi_vlg_check_tst;
