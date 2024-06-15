library verilog;
use verilog.vl_types.all;
entity TZKZQ_vlg_sample_tst is
    port(
        clk_key         : in     vl_logic;
        day_cur         : in     vl_logic_vector(4 downto 0);
        hour_cur        : in     vl_logic_vector(4 downto 0);
        key3            : in     vl_logic;
        key4            : in     vl_logic;
        key5            : in     vl_logic;
        key6            : in     vl_logic;
        max_days        : in     vl_logic_vector(4 downto 0);
        min_cur         : in     vl_logic_vector(5 downto 0);
        mon_cur         : in     vl_logic_vector(3 downto 0);
        sec_cur         : in     vl_logic_vector(5 downto 0);
        week_cur        : in     vl_logic_vector(2 downto 0);
        year_cur        : in     vl_logic_vector(6 downto 0);
        sampler_tx      : out    vl_logic
    );
end TZKZQ_vlg_sample_tst;
