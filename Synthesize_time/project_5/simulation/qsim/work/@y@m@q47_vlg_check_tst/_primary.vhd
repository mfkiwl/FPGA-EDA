library verilog;
use verilog.vl_types.all;
entity YMQ47_vlg_check_tst is
    port(
        selout8         : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end YMQ47_vlg_check_tst;
