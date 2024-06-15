library verilog;
use verilog.vl_types.all;
entity YMQ58 is
    port(
        a               : in     vl_logic_vector(4 downto 0);
        Y               : out    vl_logic_vector(7 downto 0)
    );
end YMQ58;
