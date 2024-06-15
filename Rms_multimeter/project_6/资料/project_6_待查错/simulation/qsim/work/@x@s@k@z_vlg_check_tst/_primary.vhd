library verilog;
use verilog.vl_types.all;
entity XSKZ_vlg_check_tst is
    port(
        dout7           : in     vl_logic_vector(7 downto 0);
        sel             : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end XSKZ_vlg_check_tst;
