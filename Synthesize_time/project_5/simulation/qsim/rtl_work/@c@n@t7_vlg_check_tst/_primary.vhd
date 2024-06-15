library verilog;
use verilog.vl_types.all;
entity CNT7_vlg_check_tst is
    port(
        num             : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end CNT7_vlg_check_tst;
