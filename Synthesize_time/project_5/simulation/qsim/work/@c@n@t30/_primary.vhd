library verilog;
use verilog.vl_types.all;
entity CNT30 is
    port(
        ld              : in     vl_logic;
        clk             : in     vl_logic;
        datain          : in     vl_logic_vector(4 downto 0);
        year            : in     vl_logic_vector(6 downto 0);
        yue             : in     vl_logic_vector(3 downto 0);
        num             : out    vl_logic_vector(4 downto 0);
        maxday          : out    vl_logic_vector(4 downto 0);
        cq              : out    vl_logic
    );
end CNT30;
