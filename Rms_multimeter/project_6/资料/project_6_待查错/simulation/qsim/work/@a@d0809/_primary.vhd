library verilog;
use verilog.vl_types.all;
entity AD0809 is
    port(
        clk             : in     vl_logic;
        eoc             : in     vl_logic;
        din             : in     vl_logic_vector(7 downto 0);
        start           : out    vl_logic;
        oe              : out    vl_logic;
        ale             : out    vl_logic;
        dout            : out    vl_logic_vector(7 downto 0)
    );
end AD0809;
