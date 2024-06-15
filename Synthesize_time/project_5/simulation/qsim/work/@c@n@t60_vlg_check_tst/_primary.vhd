library verilog;
use verilog.vl_types.all;
entity CNT60_vlg_check_tst is
    port(
        co              : in     vl_logic;
        num             : in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end CNT60_vlg_check_tst;
