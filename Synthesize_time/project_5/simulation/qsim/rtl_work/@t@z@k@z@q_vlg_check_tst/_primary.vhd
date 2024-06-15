library verilog;
use verilog.vl_types.all;
entity TZKZQ_vlg_check_tst is
    port(
        day             : in     vl_logic_vector(4 downto 0);
        day_en          : in     vl_logic;
        hour            : in     vl_logic_vector(4 downto 0);
        hour_en         : in     vl_logic;
        min             : in     vl_logic_vector(5 downto 0);
        min_en          : in     vl_logic;
        mon             : in     vl_logic_vector(3 downto 0);
        mon_en          : in     vl_logic;
        sec             : in     vl_logic_vector(5 downto 0);
        sec_en          : in     vl_logic;
        week            : in     vl_logic_vector(2 downto 0);
        week_en         : in     vl_logic;
        year            : in     vl_logic_vector(6 downto 0);
        year_en         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end TZKZQ_vlg_check_tst;
