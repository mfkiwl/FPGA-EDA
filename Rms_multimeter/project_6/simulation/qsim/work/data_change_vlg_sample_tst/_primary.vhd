library verilog;
use verilog.vl_types.all;
entity data_change_vlg_sample_tst is
    port(
        din0            : in     vl_logic_vector(3 downto 0);
        din1            : in     vl_logic_vector(3 downto 0);
        din2            : in     vl_logic_vector(3 downto 0);
        din3            : in     vl_logic_vector(4 downto 0);
        din4            : in     vl_logic_vector(2 downto 0);
        kk              : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end data_change_vlg_sample_tst;
