library verilog;
use verilog.vl_types.all;
entity TZKZQ is
    port(
        key3            : in     vl_logic;
        key4            : in     vl_logic;
        key5            : in     vl_logic;
        key6            : in     vl_logic;
        clk_key         : in     vl_logic;
        max_days        : in     vl_logic_vector(4 downto 0);
        sec_en          : out    vl_logic;
        min_en          : out    vl_logic;
        hour_en         : out    vl_logic;
        day_en          : out    vl_logic;
        mon_en          : out    vl_logic;
        year_en         : out    vl_logic;
        week_en         : out    vl_logic;
        hour_cur        : in     vl_logic_vector(4 downto 0);
        min_cur         : in     vl_logic_vector(5 downto 0);
        sec_cur         : in     vl_logic_vector(5 downto 0);
        year_cur        : in     vl_logic_vector(6 downto 0);
        mon_cur         : in     vl_logic_vector(3 downto 0);
        day_cur         : in     vl_logic_vector(4 downto 0);
        week_cur        : in     vl_logic_vector(2 downto 0);
        sec             : out    vl_logic_vector(5 downto 0);
        min             : out    vl_logic_vector(5 downto 0);
        hour            : out    vl_logic_vector(4 downto 0);
        day             : out    vl_logic_vector(4 downto 0);
        mon             : out    vl_logic_vector(3 downto 0);
        year            : out    vl_logic_vector(6 downto 0);
        week            : out    vl_logic_vector(2 downto 0)
    );
end TZKZQ;
