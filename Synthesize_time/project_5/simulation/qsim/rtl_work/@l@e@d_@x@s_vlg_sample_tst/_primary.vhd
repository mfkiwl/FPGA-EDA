library verilog;
use verilog.vl_types.all;
entity LED_XS_vlg_sample_tst is
    port(
        day_en          : in     vl_logic;
        hour_en         : in     vl_logic;
        min_en          : in     vl_logic;
        mon_en          : in     vl_logic;
        sec_en          : in     vl_logic;
        week_en         : in     vl_logic;
        year_en         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end LED_XS_vlg_sample_tst;
