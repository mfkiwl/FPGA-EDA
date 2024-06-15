library verilog;
use verilog.vl_types.all;
entity CNT30_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        datain          : in     vl_logic_vector(4 downto 0);
        ld              : in     vl_logic;
        year            : in     vl_logic_vector(6 downto 0);
        yue             : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end CNT30_vlg_sample_tst;
