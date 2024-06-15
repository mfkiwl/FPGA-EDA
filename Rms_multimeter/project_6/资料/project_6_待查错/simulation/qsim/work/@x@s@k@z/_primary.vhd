library verilog;
use verilog.vl_types.all;
entity XSKZ is
    port(
        kk              : in     vl_logic_vector(2 downto 0);
        ru              : in     vl_logic_vector(15 downto 0);
        clk24M          : in     vl_logic;
        din7            : in     vl_logic_vector(4 downto 0);
        dout7           : out    vl_logic_vector(7 downto 0);
        sel             : out    vl_logic_vector(7 downto 0)
    );
end XSKZ;
