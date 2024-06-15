library verilog;
use verilog.vl_types.all;
entity genhao_vlg_check_tst is
    port(
        dout            : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end genhao_vlg_check_tst;
