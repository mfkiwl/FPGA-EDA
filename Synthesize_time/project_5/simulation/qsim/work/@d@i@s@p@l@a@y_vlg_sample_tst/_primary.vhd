library verilog;
use verilog.vl_types.all;
entity DISPLAY_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        hbcd            : in     vl_logic_vector(3 downto 0);
        lbcd            : in     vl_logic_vector(3 downto 0);
        selout          : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end DISPLAY_vlg_sample_tst;
