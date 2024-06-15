library verilog;
use verilog.vl_types.all;
entity CNT7 is
    port(
        ld              : in     vl_logic;
        clr             : in     vl_logic;
        clk             : in     vl_logic;
        data            : in     vl_logic_vector(2 downto 0);
        num             : out    vl_logic_vector(2 downto 0)
    );
end CNT7;
