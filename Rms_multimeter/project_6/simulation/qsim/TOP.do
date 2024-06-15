onerror {exit -code 1}
vlib work
vlog -work work TOP.vo
vlog -work work gonglvyinshu.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.gonglvyinsu_vlg_vec_tst -voptargs="+acc"
vcd file -direction TOP.msim.vcd
vcd add -internal gonglvyinsu_vlg_vec_tst/*
vcd add -internal gonglvyinsu_vlg_vec_tst/i1/*
run -all
quit -f
