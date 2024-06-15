transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/YMQ58.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/quling.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/display.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/data_change.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/shizaigonglv.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/qiuhe_gong.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/quzhiliu.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/qiuhe.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/genhao.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/youxiaozhi.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/yougong.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/xuanze.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/XSKZ.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/wugong.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/gonglvyinsu.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/fenpin.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/AD0809.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/TOP.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/sin.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/cos.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/ROM.vhd}

vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6/simulation/qsim/TOP.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  top_vhd_tst

add wave *
view structure
view signals
run -all
