library verilog;
use verilog.vl_types.all;
entity TOP_vlg_check_tst is
    port(
        com             : in     vl_logic_vector(7 downto 0);
        led1            : in     vl_logic;
        led2            : in     vl_logic;
        led3            : in     vl_logic;
        led4            : in     vl_logic;
        led5            : in     vl_logic;
        led6            : in     vl_logic;
        led7            : in     vl_logic;
        led8            : in     vl_logic;
        s_day_en        : in     vl_logic;
        s_hour_en       : in     vl_logic;
        s_min_en        : in     vl_logic;
        s_mon_en        : in     vl_logic;
        s_newclk        : in     vl_logic;
        s_sec_en        : in     vl_logic;
        s_selout        : in     vl_logic_vector(3 downto 0);
        s_week_en       : in     vl_logic;
        s_year_en       : in     vl_logic;
        seg             : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end TOP_vlg_check_tst;
