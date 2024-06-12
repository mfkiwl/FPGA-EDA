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

% 将数据以二进制字符串的形式保存到txt中
% 向下取整，转换为16bit的二进制
data = (dec2bin(floor(mixed_signal'),16));
file_id1 = fopen("./src/fir_signal_data_gen.txt","w");
% 循环写入每行二进制字符串
for i = 1:size(data, 1)
    fprintf(file_id1, '%s\n', data(i, :));
end

fclose(file_id1);

% 设计FIR滤波器
order = 40; % 滤波器阶数
cutoff_freq = 100; % 截止频率（以Hz为单位）
normalized_cutoff = cutoff_freq / (Fs/2); % 归一化的截止频率
b = fir1(order, normalized_cutoff, 'low'); % 设计低通滤波器系数

% 对混合信号进行滤波
filtered_signal = filter(b, 1, mixed_signal); % 应用滤波器

% 绘图
subplot(4,1,1);
plot(t,mixed_signal);
title("mix");

subplot(4,1,2);
plot(t,filtered_signal);
title("filtered");

subplot(4,1,3);
plot(t,sin2);
title("sin2");

