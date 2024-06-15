library verilog;
use verilog.vl_types.all;
entity DISPLAY_vlg_check_tst is
    port(
        bcd             : in     vl_logic_vector(3 downto 0);
        com             : in     vl_logic_vector(7 downto 0);
        div2clk         : in     vl_logic;
        seg             : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end DISPLAY_vlg_check_tst;
