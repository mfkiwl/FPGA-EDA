library verilog;
use verilog.vl_types.all;
entity DISPLAY is
    port(
        hbcd            : in     vl_logic_vector(3 downto 0);
        lbcd            : in     vl_logic_vector(3 downto 0);
        selout          : in     vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        com             : out    vl_logic_vector(7 downto 0);
        bcd             : out    vl_logic_vector(3 downto 0);
        div2clk         : out    vl_logic;
        seg             : out    vl_logic_vector(7 downto 0)
    );
end DISPLAY;
