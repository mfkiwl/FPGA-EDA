library verilog;
use verilog.vl_types.all;
entity wugong_vlg_check_tst is
    port(
        wugong          : in     vl_logic_vector(17 downto 0);
        wugong_pinfang_int: in     vl_logic_vector(30 downto 0);
        sampler_rx      : in     vl_logic
    );
end wugong_vlg_check_tst;
