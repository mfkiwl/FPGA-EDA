library verilog;
use verilog.vl_types.all;
entity CNT100_vlg_check_tst is
    port(
        co              : in     vl_logic;
        num             : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end CNT100_vlg_check_tst;
