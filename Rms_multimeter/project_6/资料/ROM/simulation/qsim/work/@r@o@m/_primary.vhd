library verilog;
use verilog.vl_types.all;
entity ROM is
    port(
        clk             : in     vl_logic;
        din1            : out    vl_logic_vector(7 downto 0);
        din2            : out    vl_logic_vector(7 downto 0)
    );
end ROM;
