library verilog;
use verilog.vl_types.all;
entity LED_XS_vlg_check_tst is
    port(
        led1            : in     vl_logic;
        led2            : in     vl_logic;
        led3            : in     vl_logic;
        led4            : in     vl_logic;
        led5            : in     vl_logic;
        led6            : in     vl_logic;
        led7            : in     vl_logic;
        led8            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end LED_XS_vlg_check_tst;
