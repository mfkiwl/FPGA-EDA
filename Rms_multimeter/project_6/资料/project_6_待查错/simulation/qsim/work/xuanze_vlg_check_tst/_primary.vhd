library verilog;
use verilog.vl_types.all;
entity xuanze_vlg_check_tst is
    port(
        dout            : in     vl_logic_vector(15 downto 0);
        dout7           : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end xuanze_vlg_check_tst;
