function [C] = C(x)
%This function will be used to normalize dct coefficients
%   Detailed explanation goes here
if x == 1
    C = 1/(sqrt(2));
else
    C = 1;
end 
end

