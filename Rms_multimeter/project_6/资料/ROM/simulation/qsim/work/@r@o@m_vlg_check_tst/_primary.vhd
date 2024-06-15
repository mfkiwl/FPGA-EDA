library verilog;
use verilog.vl_types.all;
entity ROM_vlg_check_tst is
    port(
        din1            : in     vl_logic_vector(7 downto 0);
        din2            : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end ROM_vlg_check_tst;
