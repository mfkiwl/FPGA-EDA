onerror {exit -code 1}
vlib work
vlog -work work ROM.vo
vlog -work work sin.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.sin_vlg_vec_tst -voptargs="+acc"
vcd file -direction ROM.msim.vcd
vcd add -internal sin_vlg_vec_tst/*
vcd add -internal sin_vlg_vec_tst/i1/*
run -all
quit -f
