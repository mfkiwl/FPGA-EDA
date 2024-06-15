library verilog;
use verilog.vl_types.all;
entity YMQ47 is
    port(
        bcd4            : in     vl_logic_vector(3 downto 0);
        selout8         : out    vl_logic_vector(7 downto 0)
    );
end YMQ47;
