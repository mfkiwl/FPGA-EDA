library verilog;
use verilog.vl_types.all;
entity quling_vlg_sample_tst is
    port(
        din0            : in     vl_logic_vector(7 downto 0);
        din1            : in     vl_logic_vector(7 downto 0);
        din2            : in     vl_logic_vector(7 downto 0);
        din3            : in     vl_logic_vector(7 downto 0);
        din4            : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end quling_vlg_sample_tst;
