onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_dcnt9999/u1/CLK1
add wave -noupdate /tb_dcnt9999/u1/CLR
add wave -noupdate /tb_dcnt9999/u1/ENA
add wave -noupdate /tb_dcnt9999/u1/CLK2
add wave -noupdate /tb_dcnt9999/u1/COM
add wave -noupdate /tb_dcnt9999/u1/SEG
add wave -noupdate -color {Medium Violet Red} /tb_dcnt9999/u1/S1
add wave -noupdate -color {Medium Violet Red} /tb_dcnt9999/u1/S2
add wave -noupdate -color {Medium Violet Red} /tb_dcnt9999/u1/S3
add wave -noupdate -color {Medium Violet Red} /tb_dcnt9999/u1/S4
add wave -noupdate -color {Medium Violet Red} /tb_dcnt9999/u1/S5
add wave -noupdate -color {Medium Violet Red} /tb_dcnt9999/u1/S6
add wave -noupdate /tb_dcnt9999/u1/S
add wave -noupdate /tb_dcnt9999/u1/DOUT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {220000 ps} 0}
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
WaveRestoreZoom {103906 ps} {596094 ps}
