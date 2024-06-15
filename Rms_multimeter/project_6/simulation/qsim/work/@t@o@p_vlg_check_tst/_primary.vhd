library verilog;
use verilog.vl_types.all;
entity TOP_vlg_check_tst is
    port(
        ale1            : in     vl_logic;
        ale2            : in     vl_logic;
        dout            : in     vl_logic_vector(7 downto 0);
        oe1             : in     vl_logic;
        oe2             : in     vl_logic;
        s_shizaigonglv  : in     vl_logic_vector(17 downto 0);
        sel             : in     vl_logic_vector(7 downto 0);
        start1          : in     vl_logic;
        start2          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end TOP_vlg_check_tst;
