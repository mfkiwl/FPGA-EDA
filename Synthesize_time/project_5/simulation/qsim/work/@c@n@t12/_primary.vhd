library verilog;
use verilog.vl_types.all;
entity CNT12 is
    port(
        ld              : in     vl_logic;
        clr             : in     vl_logic;
        clk             : in     vl_logic;
        data            : in     vl_logic_vector(3 downto 0);
        num             : out    vl_logic_vector(3 downto 0);
        co              : out    vl_logic
    );
end CNT12;
