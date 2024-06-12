function y = my_fir(x,coefficient)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

y  = randn(1,length(x));
for i=1:length(x)-length(coefficient)+1
    sum = 0;
    for j=0:length(coefficient)-1
        sum = x(i+j)*coefficient(j+1) + sum;
    end
    y(i) = sum;
end

end