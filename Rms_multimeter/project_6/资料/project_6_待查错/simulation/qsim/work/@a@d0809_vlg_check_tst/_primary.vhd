library verilog;
use verilog.vl_types.all;
entity AD0809_vlg_check_tst is
    port(
        ale             : in     vl_logic;
        dout            : in     vl_logic_vector(7 downto 0);
        oe              : in     vl_logic;
        start           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end AD0809_vlg_check_tst;
