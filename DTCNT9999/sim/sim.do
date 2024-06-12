vlib  work
vmap  work ./work

vcom [pwd]/../src/*.vhd

#设置顶层仿真module名
set top_module tb_DCNT9999

# 设置仿真内存大小为4GB
#vish -memory_size 1GB

vsim -t 1ps -voptargs="+acc"  ${top_module}

#do ./wave.do 
add wave -recursive ${top_module}/*
#add wave -noupdate ${top_module}/*
#add wave ${top_module}/u1/U9/*
#add wave ${top_module}/u1/*
#add wave /*

view wave
view structure
view signals

run 300us
#run 3ms

