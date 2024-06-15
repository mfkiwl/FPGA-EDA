library verilog;
use verilog.vl_types.all;
entity quzhiliu_vlg_sample_tst is
    port(
        v               : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end quzhiliu_vlg_sample_tst;
