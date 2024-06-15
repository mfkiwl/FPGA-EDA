library verilog;
use verilog.vl_types.all;
entity xuanze is
    port(
        k               : in     vl_logic_vector(2 downto 0);
        din0            : in     vl_logic_vector(13 downto 0);
        din1            : in     vl_logic_vector(13 downto 0);
        din2            : in     vl_logic_vector(17 downto 0);
        din3            : in     vl_logic_vector(17 downto 0);
        din4            : in     vl_logic_vector(17 downto 0);
        dout            : out    vl_logic_vector(15 downto 0);
        dout7           : out    vl_logic_vector(4 downto 0)
    );
end xuanze;
