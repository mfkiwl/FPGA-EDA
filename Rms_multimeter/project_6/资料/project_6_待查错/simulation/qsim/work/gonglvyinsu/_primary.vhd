library verilog;
use verilog.vl_types.all;
entity gonglvyinsu is
    port(
        clk             : in     vl_logic;
        shizai          : in     vl_logic_vector(17 downto 0);
        yougong         : in     vl_logic_vector(17 downto 0);
        s_result_100_25 : out    vl_logic_vector(24 downto 0);
        s_gonglvyinsu25 : out    vl_logic_vector(24 downto 0);
        gonglvyinsu     : out    vl_logic_vector(17 downto 0)
    );
end gonglvyinsu;
