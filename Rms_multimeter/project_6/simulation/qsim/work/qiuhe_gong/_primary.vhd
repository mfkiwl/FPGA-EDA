library verilog;
use verilog.vl_types.all;
entity qiuhe_gong is
    port(
        clk8k           : in     vl_logic;
        din1            : in     vl_logic_vector(7 downto 0);
        din2            : in     vl_logic_vector(7 downto 0);
        dout            : out    vl_logic_vector(28 downto 0)
    );
end qiuhe_gong;
