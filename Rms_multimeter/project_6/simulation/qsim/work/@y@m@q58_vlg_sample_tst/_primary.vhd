library verilog;
use verilog.vl_types.all;
entity YMQ58_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(4 downto 0);
        sampler_tx      : out    vl_logic
    );
end YMQ58_vlg_sample_tst;
