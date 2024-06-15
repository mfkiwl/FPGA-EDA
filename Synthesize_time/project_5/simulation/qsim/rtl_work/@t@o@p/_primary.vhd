library verilog;
use verilog.vl_types.all;
entity TOP is
    port(
        clk             : in     vl_logic;
        s_sec_en        : out    vl_logic;
        s_min_en        : out    vl_logic;
        s_hour_en       : out    vl_logic;
        s_day_en        : out    vl_logic;
        s_mon_en        : out    vl_logic;
        s_year_en       : out    vl_logic;
        s_week_en       : out    vl_logic;
        s_selout        : out    vl_logic_vector(3 downto 0);
        s_newclk        : out    vl_logic;
        key1            : in     vl_logic;
        key2            : in     vl_logic;
        key3            : in     vl_logic;
        key4            : in     vl_logic;
        key5            : in     vl_logic;
        key6            : in     vl_logic;
        led1            : out    vl_logic;
        led2            : out    vl_logic;
        led3            : out    vl_logic;
        led4            : out    vl_logic;
        led5            : out    vl_logic;
        led6            : out    vl_logic;
        led7            : out    vl_logic;
        led8            : out    vl_logic;
        com             : out    vl_logic_vector(7 downto 0);
        seg             : out    vl_logic_vector(7 downto 0);
        clr             : in     vl_logic
    );
end TOP;
