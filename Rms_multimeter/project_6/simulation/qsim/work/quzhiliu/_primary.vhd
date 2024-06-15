library verilog;
use verilog.vl_types.all;
entity quzhiliu is
    port(
        v               : in     vl_logic_vector(7 downto 0);
        dout            : out    vl_logic_vector(7 downto 0)
    );
end quzhiliu;
