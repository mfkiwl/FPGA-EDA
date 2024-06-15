library verilog;
use verilog.vl_types.all;
entity CNT30_vlg_check_tst is
    port(
        cq              : in     vl_logic;
        maxday          : in     vl_logic_vector(4 downto 0);
        num             : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end CNT30_vlg_check_tst;
