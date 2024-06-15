library verilog;
use verilog.vl_types.all;
entity qiuhe_gong_vlg_check_tst is
    port(
        dout            : in     vl_logic_vector(28 downto 0);
        sampler_rx      : in     vl_logic
    );
end qiuhe_gong_vlg_check_tst;
