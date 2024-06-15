transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/YMQ58.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/quling.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/display.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/data_change.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/shizaigonglv.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/qiuhe_gong.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/quzhiliu.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/qiuhe.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/genhao.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/youxiaozhi.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/yougong.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/xuanze.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/XSKZ.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/wugong.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/gonglvyinsu.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/fenpin.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/TOP.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/sin.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/cos.vhd}
vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/ROM.vhd}

vcom -93 -work work {E:/quartus/EDA_PROJECT/project_6_xiugai/simulation/qsim/TOP.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  top_vhd_tst

add wave *
view structure
view signals
run -all
