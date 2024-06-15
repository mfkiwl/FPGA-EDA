library verilog;
use verilog.vl_types.all;
entity quling is
    port(
        din0            : in     vl_logic_vector(7 downto 0);
        din1            : in     vl_logic_vector(7 downto 0);
        din2            : in     vl_logic_vector(7 downto 0);
        din3            : in     vl_logic_vector(7 downto 0);
        din4            : in     vl_logic_vector(7 downto 0);
        dout0           : out    vl_logic_vector(7 downto 0);
        dout1           : out    vl_logic_vector(7 downto 0);
        dout2           : out    vl_logic_vector(7 downto 0);
        dout3           : out    vl_logic_vector(7 downto 0);
        dout4           : out    vl_logic_vector(7 downto 0)
    );
end quling;
