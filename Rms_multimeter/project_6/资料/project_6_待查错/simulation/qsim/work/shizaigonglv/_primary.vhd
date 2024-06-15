library verilog;
use verilog.vl_types.all;
entity shizaigonglv is
    port(
        clk             : in     vl_logic;
        u_youxiaozhi    : in     vl_logic_vector(13 downto 0);
        i_youxiaozhi    : in     vl_logic_vector(13 downto 0);
        shizaigonglv    : out    vl_logic_vector(17 downto 0)
    );
end shizaigonglv;
