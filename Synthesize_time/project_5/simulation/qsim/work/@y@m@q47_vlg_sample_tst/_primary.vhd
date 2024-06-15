library verilog;
use verilog.vl_types.all;
entity YMQ47_vlg_sample_tst is
    port(
        bcd4            : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end YMQ47_vlg_sample_tst;
