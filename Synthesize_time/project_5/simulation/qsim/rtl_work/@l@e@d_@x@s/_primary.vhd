library verilog;
use verilog.vl_types.all;
entity LED_XS is
    port(
        sec_en          : in     vl_logic;
        min_en          : in     vl_logic;
        hour_en         : in     vl_logic;
        day_en          : in     vl_logic;
        mon_en          : in     vl_logic;
        year_en         : in     vl_logic;
        week_en         : in     vl_logic;
        led1            : out    vl_logic;
        led2            : out    vl_logic;
        led3            : out    vl_logic;
        led4            : out    vl_logic;
        led5            : out    vl_logic;
        led6            : out    vl_logic;
        led7            : out    vl_logic;
        led8            : out    vl_logic
    );
end LED_XS;
