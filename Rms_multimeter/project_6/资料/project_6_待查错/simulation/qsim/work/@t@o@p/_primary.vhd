library verilog;
use verilog.vl_types.all;
entity TOP is
    port(
        clk24M          : in     vl_logic;
        eoc1            : in     vl_logic;
        eoc2            : in     vl_logic;
        key             : in     vl_logic_vector(2 downto 0);
        start1          : out    vl_logic;
        oe1             : out    vl_logic;
        ale1            : out    vl_logic;
        start2          : out    vl_logic;
        oe2             : out    vl_logic;
        ale2            : out    vl_logic;
        dout            : out    vl_logic_vector(7 downto 0);
        s_shizaigonglv  : out    vl_logic_vector(17 downto 0);
        sel             : out    vl_logic_vector(7 downto 0)
    );
end TOP;
