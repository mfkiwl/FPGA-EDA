clc;
clear;
Fs = 5000; % 采样率（以Hz为单位）
duration = 0.1; % 信号时长（以秒为单位）
signal_length = duration*Fs;
t = (0:1/Fs:duration-1/Fs); % 时间向量
% 频率
freq_1 = 500;
freq_2 = 50;
freq_3 = 300;
% 信号
sin1 = 100*sin(2*pi*freq_1*t);
sin2 = 128*sin(2*pi*freq_2*t);
sin3 = 100*sin(2*pi*freq_3*t);

% 设置噪声参数
amplitude = 30.5; % 噪声幅度
% 生成随机噪声
noise = amplitude * randn(1, length(t));
% 混合
mixed_signal = sin1 + sin2 + sin3;

% FIR滤波
filtered_signal = filter(coeffient(),mixed_signal); % 应用滤波器

% MY-滤波
my_filtered_signal = my_fir(mixed_signal,coeffient().Numerator); % 应用滤波器

% FPGA滤波
fileID = fopen('./src/fpga_fir_data.txt','r');
fpga_bin_data = textscan(fileID,'%s');%二进制读
fpga_fir_data = randn(1,length(fpga_bin_data{1,1})+2);
for i=1:length(fpga_bin_data{1,1})
    buma_data = buma(fpga_bin_data{1,1}{i,1});
    if buma_data(1)=='1'
        real_data = -1*bin2dec(buma_data(2:length(buma_data)));
    else 
        real_data = 1*bin2dec(buma_data(2:length(buma_data)));
    end
    fpga_fir_data(i) = real_data;
end


% 绘图
subplot(5,1,1);
plot(t,mixed_signal);
title("mix-signal");

subplot(5,1,2);
plot(t,fpga_fir_data,'r');
title("fpga-FIR-data");

subplot(5,1,3);
plot(t,my_filtered_signal,'r');
title("my_filtered_data");

subplot(5,1,4);
plot(t,filtered_signal,'r');
title("matlab-FIR-data");

subplot(5,1,5);
plot(t,sin2);
title("real-signal-data");




