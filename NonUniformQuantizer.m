function [Compressed_Signal,Xmax,MSE] =  NonUniformQuantizer(x,A)
  %%Non-linear Quantization
  %%A-law: A-law nonlinear quantization
  %%x = input vector
  %%Cx = A-law compressor output
  %%Xmax = maximum of input vector x
  Xmax  = max(abs(x));
  for i = 1:length(x)
    if(x(i)/Xmax < = 1/A)
       Compressed_Signal(i) = A*abs(x(i)/Xmax)./(1+log(A));
    elseif(x(i)/Xmax > 1/A)
      Compressed_Signal(i) = (1+log(A*abs(x(i)/Xmax)))./(1+log(A));
    end
  Compressed_Signal = Compressed_Signal/Xmax; %%normalization of output vector
  Compressed_Signal = Compressed_Signal';
  Errorcalc=x-Compressed_Signal;
  MSE=mean(Errorcalc.^2);
end

