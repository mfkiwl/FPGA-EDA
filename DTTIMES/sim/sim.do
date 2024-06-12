vlib  work
vmap  work ./work

vcom [pwd]/../src/*.vhd

#设置顶层仿真module名
#set top_module DTTIMES_tb
set top_module CNT6_tb


# 设置仿真内存大小为4GB
#vish -memory_size 1GB

vsim -t 1ps -voptargs="+acc"  ${top_module}

#do ./wave.do 
#add wave -recursive ${top_module}/*
#add wave -noupdate ${top_module}/*
#add wave ${top_module}/DTTIMS_inst/u8/*
add wave /*

view wave
view structure
view signals

run 30us
#run 3ms

