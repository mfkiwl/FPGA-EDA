vlib  work
vmap  work ./work

vcom -2008 [pwd]/../src/*.vhd

#设置顶层仿真module名
set top_module filter_tb


# 设置仿真内存大小为4GB
#vish -memory_size 1GB

#vsim -t 1ps -voptargs="+acc"  ${top_module}

vsim -voptargs=+acc work.filter_tb

do ./wave.do 
#add wave -recursive ${top_module}/*
#add wave -noupdate ${top_module}/*
#add wave ${top_module}/freq_inst/*
#add wave ${top_module}/freq_inst/u10/*
#add wave /*

view wave
view structure
view signals

run 300us
#run 3ms

