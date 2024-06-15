onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /filter_tb/clk
add wave -noupdate /filter_tb/clk_enable
add wave -noupdate /filter_tb/reset
add wave -noupdate -format Analog-Step -height 74 -max 311.00000000000006 -min -312.0 -radix decimal /filter_tb/filter_in
add wave -noupdate -format Analog-Step -height 74 -max 36430677.0 -min -36356913.0 -radix decimal /filter_tb/filter_out
add wave -noupdate -format Analog-Step -height 74 -max 138.00000000000003 -min -139.0 -radix decimal /filter_tb/filter_dequan
add wave -noupdate /filter_tb/init_rd
add wave -noupdate /filter_tb/init_wr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1200 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ns} {2462 ns}
