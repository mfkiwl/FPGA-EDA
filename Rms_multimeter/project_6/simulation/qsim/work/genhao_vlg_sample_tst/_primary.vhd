library verilog;
use verilog.vl_types.all;
entity genhao_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        din             : in     vl_logic_vector(16 downto 0);
        sampler_tx      : out    vl_logic
    );
end genhao_vlg_sample_tst;
