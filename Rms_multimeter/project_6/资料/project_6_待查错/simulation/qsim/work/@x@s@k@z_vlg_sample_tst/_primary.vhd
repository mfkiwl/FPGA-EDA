library verilog;
use verilog.vl_types.all;
entity XSKZ_vlg_sample_tst is
    port(
        clk24M          : in     vl_logic;
        din7            : in     vl_logic_vector(4 downto 0);
        kk              : in     vl_logic_vector(2 downto 0);
        ru              : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end XSKZ_vlg_sample_tst;
