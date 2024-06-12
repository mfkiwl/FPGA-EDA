onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /freq_tb/freq_inst/clk_in
add wave -noupdate /freq_tb/freq_inst/clk1
add wave -noupdate /freq_tb/freq_inst/clk2
add wave -noupdate /freq_tb/freq_inst/ena
add wave -noupdate /freq_tb/freq_inst/s_data_in
add wave -noupdate -radix unsigned /freq_tb/freq_inst/s_data_out
add wave -noupdate /freq_tb/freq_inst/com
add wave -noupdate /freq_tb/freq_inst/seg
add wave -noupdate /freq_tb/freq_inst/cnt_temp
add wave -noupdate /freq_tb/freq_inst/s0_cq
add wave -noupdate /freq_tb/freq_inst/s1_cq
add wave -noupdate /freq_tb/freq_inst/s2_cq
add wave -noupdate /freq_tb/freq_inst/s3_cq
add wave -noupdate /freq_tb/freq_inst/s4_cq
add wave -noupdate /freq_tb/freq_inst/s5_cq
add wave -noupdate /freq_tb/freq_inst/s6_cq
add wave -noupdate /freq_tb/freq_inst/s7_cq
add wave -noupdate /freq_tb/freq_inst/s0_co
add wave -noupdate /freq_tb/freq_inst/s1_co
add wave -noupdate /freq_tb/freq_inst/s2_co
add wave -noupdate /freq_tb/freq_inst/s3_co
add wave -noupdate /freq_tb/freq_inst/s4_co
add wave -noupdate /freq_tb/freq_inst/s5_co
add wave -noupdate /freq_tb/freq_inst/s6_co
add wave -noupdate /freq_tb/freq_inst/s7_co
add wave -noupdate /freq_tb/freq_inst/s_clr
add wave -noupdate /freq_tb/freq_inst/s_sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17542370 ps} 0}
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
WaveRestoreZoom {12620494 ps} {22464246 ps}
