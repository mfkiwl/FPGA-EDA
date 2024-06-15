library verilog;
use verilog.vl_types.all;
entity xuanze_vlg_sample_tst is
    port(
        din0            : in     vl_logic_vector(13 downto 0);
        din1            : in     vl_logic_vector(13 downto 0);
        din2            : in     vl_logic_vector(17 downto 0);
        din3            : in     vl_logic_vector(17 downto 0);
        din4            : in     vl_logic_vector(17 downto 0);
        k               : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end xuanze_vlg_sample_tst;
