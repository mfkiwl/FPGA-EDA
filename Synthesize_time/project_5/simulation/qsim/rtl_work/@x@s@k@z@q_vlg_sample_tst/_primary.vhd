library verilog;
use verilog.vl_types.all;
entity XSKZQ_vlg_sample_tst is
    port(
        clk_scan        : in     vl_logic;
        day             : in     vl_logic_vector(4 downto 0);
        hour            : in     vl_logic_vector(4 downto 0);
        min             : in     vl_logic_vector(5 downto 0);
        mon             : in     vl_logic_vector(3 downto 0);
        sec             : in     vl_logic_vector(5 downto 0);
        week            : in     vl_logic_vector(2 downto 0);
        year            : in     vl_logic_vector(6 downto 0);
        sampler_tx      : out    vl_logic
    );
end XSKZQ_vlg_sample_tst;
