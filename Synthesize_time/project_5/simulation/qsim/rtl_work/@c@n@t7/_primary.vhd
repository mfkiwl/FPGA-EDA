library verilog;
use verilog.vl_types.all;
entity CNT7 is
    port(
        ld              : in     vl_logic;
        clk             : in     vl_logic;
        data            : in     vl_logic_vector(2 downto 0);
        key6            : in     vl_logic;
        num             : out    vl_logic_vector(2 downto 0)
    );
end CNT7;
