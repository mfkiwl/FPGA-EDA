library verilog;
use verilog.vl_types.all;
entity gonglvyinsu_vlg_check_tst is
    port(
        gonglvyinsu     : in     vl_logic_vector(17 downto 0);
        s_gonglvyinsu25 : in     vl_logic_vector(24 downto 0);
        s_result_100_25 : in     vl_logic_vector(24 downto 0);
        sampler_rx      : in     vl_logic
    );
end gonglvyinsu_vlg_check_tst;
