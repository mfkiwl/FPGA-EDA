library verilog;
use verilog.vl_types.all;
entity DISPLAY is
    port(
        hbcd            : in     vl_logic_vector(3 downto 0);
        lbcd            : in     vl_logic_vector(3 downto 0);
        selout          : in     vl_logic_vector(3 downto 0);
        key1            : in     vl_logic;
        key2            : in     vl_logic;
        com             : out    vl_logic_vector(7 downto 0);
        seg             : out    vl_logic_vector(7 downto 0)
    );
end DISPLAY;
