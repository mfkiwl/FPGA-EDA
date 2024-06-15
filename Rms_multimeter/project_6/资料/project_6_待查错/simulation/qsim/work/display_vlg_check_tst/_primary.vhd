library verilog;
use verilog.vl_types.all;
entity display_vlg_check_tst is
    port(
        dout            : in     vl_logic_vector(7 downto 0);
        sel             : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end display_vlg_check_tst;
