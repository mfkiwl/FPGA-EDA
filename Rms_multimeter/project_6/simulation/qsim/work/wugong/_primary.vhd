library verilog;
use verilog.vl_types.all;
entity wugong is
    port(
        clk             : in     vl_logic;
        yougong         : in     vl_logic_vector(17 downto 0);
        shizai          : in     vl_logic_vector(17 downto 0);
        wugong_pinfang_int: out    vl_logic_vector(30 downto 0);
        wugong          : out    vl_logic_vector(17 downto 0)
    );
end wugong;
