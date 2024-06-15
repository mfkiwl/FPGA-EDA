library verilog;
use verilog.vl_types.all;
entity YMQ38 is
    port(
        din             : in     vl_logic_vector(2 downto 0);
        dout            : out    vl_logic_vector(7 downto 0)
    );
end YMQ38;
