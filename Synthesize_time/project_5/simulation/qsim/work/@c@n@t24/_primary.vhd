library verilog;
use verilog.vl_types.all;
entity CNT24 is
    port(
        ld              : in     vl_logic;
        clk             : in     vl_logic;
        data            : in     vl_logic_vector(4 downto 0);
        num             : out    vl_logic_vector(4 downto 0);
        co              : out    vl_logic
    );
end CNT24;
