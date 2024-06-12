function twosComplement = buma(binary)
% 要计算补码的二进制数
%binary = '11111101'; 

%生成大小相同但均是1的二进制字符串
xor_binaryStr = repmat('1', 1, length(binary)); 

if binary(1)== '1' 
    %通过按位取反
    flipped = dec2bin(bitxor(bin2dec(binary), bin2dec(xor_binaryStr)), numel(binary)); 
    %除去最高位，加一
    dec_data = bin2dec(flipped(2:length(binary)));%
    bin_data = dec2bin(dec_data+1,length(binary)-1);
    twosComplement = ['1',bin_data];
else 
    twosComplement = binary;
end

% 显示补码结果
%disp(twosComplement);
%}