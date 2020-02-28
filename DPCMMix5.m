p2 = readData('output.avi');  %load the video and converts to double
p2 = double(p2);
[m,n] = size(p2(:,:,1));
%  % I want to have all the pixel values in one row
 for count = 1:300
 X(:,:,count) = reshape(p2(:,:,count),[1,(m*n)]);
 end 
for count = 1:300
Y1 = circshift(X,-1); %Previous pixel to the current pixel X on the same line
end
for count = 1:300
    Y2(:,:,count) = circshift(X(:,:,count),-(n)); %Pixel right above the current on the previous line.
end
%The for loop is to store the next values of X in Y
count = 1;
for count1 = 1:300-1
for count = 1:((m*n))
    Y3(:,count,count1) = X(:,count,count1+1);
end
end
for count1 = 1:((m*n))
  Y3(1,count,300) = X(1,count,1);    %I did this so i dont lose the information in X(1)
end
%%%%%%%%%%%%%%%%%%%%%%%%calculating the predictor
%%%%%%%%%%%%%%%%%%%%%%%%Xhat%%%%%%%%%%%%%%%%%%%%%%
%calculating the expected values
EY12 = zeros([1,1,300]);
EY1Y2= zeros([1,1,300]);
EY1Y3= zeros([1,1,300]);
EY22= zeros([1,1,300]);
EY2Y3= zeros([1,1,300]);
EY32= zeros([1,1,300]);
EXY1= zeros([1,1,300]);
EXY2= zeros([1,1,300]);
EXY3= zeros([1,1,300]);
for count = 1:300
EY12(:,:,count) = mean(mean(Y1(:,:,count).*Y1(:,:,count)));
EY1Y2(:,:,count) = mean(mean(Y1(:,:,count).*Y2(:,:,count)));
EY1Y3(:,:,count) = mean(mean(Y1(:,:,count).*Y3(:,:,count)));
EY22(:,:,count) = mean(mean(Y2(:,:,count).*Y2(:,:,count)));
EY2Y3(:,:,count) = mean(mean(Y2(:,:,count).*Y3(:,:,count)));
EY32(:,:,count) = mean(mean(Y3(:,:,count).*Y3(:,:,count)));
EXY1(:,:,count) = mean(mean(X(:,:,count).*Y3(:,:,count)));
EXY2(:,:,count) = mean(mean(X(:,:,count).*Y2(:,:,count)));
EXY3(:,:,count) = mean(mean(X(:,:,count).*Y3(:,:,count)));
end

D = zeros([1,1,300]);
Da = zeros([1,1,300]);
Db = zeros([1,1,300]);
Dc = zeros([1,1,300]);
a = zeros([1,1,300]);
b = zeros([1,1,300]);
c = zeros([1,1,300]);
 
for count = 1:300
D(:,:,count) = det([EY12(:,:,count) EY1Y2(:,:,count) EY1Y3(:,:,count); EY1Y2(:,:,count) EY22(:,:,count) EY2Y3(:,:,count); EY1Y3(:,:,count) EY2Y3(:,:,count) EY32(:,:,count)]);
Da(:,:,count) = det([EXY1(:,:,count) EY1Y2(:,:,count) EY1Y3(:,:,count); EXY2(:,:,count) EY22(:,:,count) EY2Y3(:,:,count); EXY3(:,:,count) EY2Y3(:,:,count) EY32(:,:,count)]);
Db(:,:,count) = det([EY12(:,:,count) EXY1(:,:,count) EY1Y3(:,:,count); EY1Y2(:,:,count) EXY2(:,:,count) EY2Y3(:,:,count); EY1Y3(:,:,count) EXY3(:,:,count) EY32(:,:,count)]);
Dc(:,:,count) = det([EY12(:,:,count) EY1Y2(:,:,count) EXY1(:,:,count); EY1Y2(:,:,count) EY22(:,:,count) EXY2(:,:,count); EY1Y3(:,:,count) EY2Y3(:,:,count) EXY3(:,:,count)]);

a(:,:,count) = Da(:,:,count)/D(:,:,count);
b(:,:,count) = Db(:,:,count)/D(:,:,count);
c(:,:,count) = Dc(:,:,count)/D(:,:,count);
end

Xhat = zeros([1,m*n,300]);
for count = 1:300
Xhat(:,:,count) = a(:,:,count)*Y1(:,:,count) + b(:,:,count)*Y2(:,:,count) + c(:,:,count)*Y3(:,:,count);
end
ers2 = X - Xhat;
 %%%%%%%5 Bit Quantization%%%
 count3 = 1;
 for count1 = 1:300
    for count2 = 1:101376
           
           if ers2(count3,count2,count1)>= 0 && ers2(count3,count2,count1)<= 7
                ers2(count3,count2,count1) = 4;
                            elseif ers2(count3,count2,count1)>= 8 && ers2(count3,count2,count1)<= 15
                ers2(count3,count2,count1) = 12;
            elseif ers2(count3,count2,count1)>= 16 && ers2(count3,count2,count1)<= 23
                ers2(count3,count2,count1) = 20;
                            elseif ers2(count3,count2,count1)>= 24 && ers2(count3,count2,count1)<= 31
                ers2(count3,count2,count1) = 28;
            elseif ers2(count3,count2,count1)>= 32 && ers2(count3,count2,count1)<= 39
                ers2(count3,count2,count1) = 36;
                            elseif ers2(count3,count2,count1)>= 40 && ers2(count3,count2,count1)<= 47
                ers2(count3,count2,count1) = 44;
            elseif ers2(count3,count2,count1)>= 48 && ers2(count3,count2,count1)<= 55
                ers2(count3,count2,count1) = 52;
                            elseif ers2(count3,count2,count1)>= 56 && ers2(count3,count2,count1)<= 63
                ers2(count3,count2,count1) = 60;
            elseif ers2(count3,count2,count1)>= 64 && ers2(count3,count2,count1)<= 71
                ers2(count3,count2,count1) = 68;
                            elseif ers2(count3,count2,count1)>= 72 && ers2(count3,count2,count1)<= 79
                ers2(count3,count2,count1) = 76;
            elseif ers2(count3,count2,count1)>= 80 && ers2(count3,count2,count1)<= 87
                ers2(count3,count2,count1) = 84;
                         elseif ers2(count3,count2,count1)>= 88 && ers2(count3,count2,count1)<= 95
                ers2(count3,count2,count1) = 92;
                            elseif ers2(count3,count2,count1)>= 96 && ers2(count3,count2,count1)<= 103
                ers2(count3,count2,count1) = 100;
            elseif ers2(count3,count2,count1)>= 104 && ers2(count3,count2,count1)<= 111
                ers2(count3,count2,count1) = 108;
                            elseif ers2(count3,count2,count1)>= 112 && ers2(count3,count2,count1)<= 119
                ers2(count3,count2,count1) = 116;
            elseif ers2(count3,count2,count1)>= 120 && ers2(count3,count2,count1)<= 127
                ers2(count3,count2,count1) = 124;
           elseif ers2(count3,count2,count1)>= 128 && ers2(count3,count2,count1)<= 135
                ers2(count3,count2,count1) = 132;
                            elseif ers2(count3,count2,count1)>= 136 && ers2(count3,count2,count1)<= 143
                ers2(count3,count2,count1) = 140;
            elseif ers2(count3,count2,count1)>= 144 && ers2(count3,count2,count1)<= 151
                ers2(count3,count2,count1) = 148;
                            elseif ers2(count3,count2,count1)>= 152 && ers2(count3,count2,count1)<= 159
                ers2(count3,count2,count1) = 156;
            elseif ers2(count3,count2,count1)>= 160 && ers2(count3,count2,count1)<= 167
                ers2(count3,count2,count1) = 164;
                            elseif ers2(count3,count2,count1)>= 168 && ers2(count3,count2,count1)<= 175
                ers2(count3,count2,count1) = 172;
            elseif ers2(count3,count2,count1)>= 176 && ers2(count3,count2,count1)<= 183
                ers2(count3,count2,count1) = 180;
                            elseif ers2(count3,count2,count1)>= 184 && ers2(count3,count2,count1)<= 191
                ers2(count3,count2,count1) = 188;
            elseif ers2(count3,count2,count1)>= 192 && ers2(count3,count2,count1)<= 199
                ers2(count3,count2,count1) = 196;
                            elseif ers2(count3,count2,count1)>= 200 && ers2(count3,count2,count1)<= 207
                ers2(count3,count2,count1) = 204;
            elseif ers2(count3,count2,count1)>= 208 && ers2(count3,count2,count1)<= 215
                ers2(count3,count2,count1) = 212;
                         elseif ers2(count3,count2,count1)>= 216 && ers2(count3,count2,count1)<= 223
                ers2(count3,count2,count1) = 220;
                            elseif ers2(count3,count2,count1)>= 224 && ers2(count3,count2,count1)<= 231
                ers2(count3,count2,count1) = 228;
            elseif ers2(count3,count2,count1)>= 232 && ers2(count3,count2,count1)<= 239
                ers2(count3,count2,count1) = 236;
                            elseif ers2(count3,count2,count1)>= 240 && ers2(count3,count2,count1)<= 247
                ers2(count3,count2,count1) = 244;
            elseif ers2(count3,count2,count1)>= 248 && ers2(count3,count2,count1)<= 255
                ers2(count3,count2,count1) = 252;
           elseif ers2(count3,count2,count1)>= 0 && ers2(count3,count2,count1)<= -7
                ers2(count3,count2,count1) = -4;
                            elseif ers2(count3,count2,count1)>= -8 && ers2(count3,count2,count1)<= -15
                ers2(count3,count2,count1) = -12;
            elseif ers2(count3,count2,count1)>= -16 && ers2(count3,count2,count1)<= -23
                ers2(count3,count2,count1) = -20;
                            elseif ers2(count3,count2,count1)>= -24 && ers2(count3,count2,count1)<= -31
                ers2(count3,count2,count1) = -28;
            elseif ers2(count3,count2,count1)>= -32 && ers2(count3,count2,count1)<= -39
                ers2(count3,count2,count1) = -36;
                            elseif ers2(count3,count2,count1)>= -40 && ers2(count3,count2,count1)<= -47
                ers2(count3,count2,count1) = -44;
            elseif ers2(count3,count2,count1)>= -48 && ers2(count3,count2,count1)<= -55
                ers2(count3,count2,count1) = -52;
                            elseif ers2(count3,count2,count1)>= -56 && ers2(count3,count2,count1)<= -63
                ers2(count3,count2,count1) = -60;
            elseif ers2(count3,count2,count1)>= -64 && ers2(count3,count2,count1)<= -71
                ers2(count3,count2,count1) = -68;
                            elseif ers2(count3,count2,count1)>= -72 && ers2(count3,count2,count1)<= -79
                ers2(count3,count2,count1) = -76;
            elseif ers2(count3,count2,count1)>= -80 && ers2(count3,count2,count1)<= -87
                ers2(count3,count2,count1) = -84;
                         elseif ers2(count3,count2,count1)>= -88 && ers2(count3,count2,count1)<= -95
                ers2(count3,count2,count1) = -92;
                            elseif ers2(count3,count2,count1)>= -96 && ers2(count3,count2,count1)<= -103
                ers2(count3,count2,count1) = -100;
            elseif ers2(count3,count2,count1)>= -104 && ers2(count3,count2,count1)<= -111
                ers2(count3,count2,count1) = -108;
                            elseif ers2(count3,count2,count1)>= -112 && ers2(count3,count2,count1)<= -119
                ers2(count3,count2,count1) = -116;
            elseif ers2(count3,count2,count1)>= -120 && ers2(count3,count2,count1)<= -127
                ers2(count3,count2,count1) = -124;
           elseif ers2(count3,count2,count1)>= -128 && ers2(count3,count2,count1)<= -135
                ers2(count3,count2,count1) = -132;
                            elseif ers2(count3,count2,count1)>= -136 && ers2(count3,count2,count1)<= -143
                ers2(count3,count2,count1) = -140;
            elseif ers2(count3,count2,count1)>= -144 && ers2(count3,count2,count1)<= -151
                ers2(count3,count2,count1) = -148;
                            elseif ers2(count3,count2,count1)>= -152 && ers2(count3,count2,count1)<= -159
                ers2(count3,count2,count1) = -156;
            elseif ers2(count3,count2,count1)>= -160 && ers2(count3,count2,count1)<= -167
                ers2(count3,count2,count1) = -164;
                            elseif ers2(count3,count2,count1)>= -168 && ers2(count3,count2,count1)<= -175
                ers2(count3,count2,count1) = -172;
            elseif ers2(count3,count2,count1)>= -176 && ers2(count3,count2,count1)<= -183
                ers2(count3,count2,count1) = -180;
                            elseif ers2(count3,count2,count1)>= -184 && ers2(count3,count2,count1)<= -191
                ers2(count3,count2,count1) = -188;
            elseif ers2(count3,count2,count1)>= -192 && ers2(count3,count2,count1)<= -199
                ers2(count3,count2,count1) = -196;
                            elseif ers2(count3,count2,count1)>= -200 && ers2(count3,count2,count1)<= -207
                ers2(count3,count2,count1) = -204;
            elseif ers2(count3,count2,count1)>= -208 && ers2(count3,count2,count1)<= -215
                ers2(count3,count2,count1) = -212;
                         elseif ers2(count3,count2,count1)>= -216 && ers2(count3,count2,count1)<= -223
                ers2(count3,count2,count1) = -220;
                            elseif ers2(count3,count2,count1)>= -224 && ers2(count3,count2,count1)<= -231
                ers2(count3,count2,count1) = -228;
            elseif ers2(count3,count2,count1)>= -232 && ers2(count3,count2,count1)<= -239
                ers2(count3,count2,count1) = -236;
                            elseif ers2(count3,count2,count1)>= -240 && ers2(count3,count2,count1)<= -247
                ers2(count3,count2,count1) = -244;
            elseif ers2(count3,count2,count1)>= -248 && ers2(count3,count2,count1)<= -255
                ers2(count3,count2,count1) = -252;
                
            end
       % end
    end
end
 %reciever side
 Xq = ers2 + Xhat;
 %%%%%%%%%%%%%%%%%%%%%%SNR%%%%%%%%%%%%%%

 Xq = double(Xq);
  for count = 1:300
      magI(1,count) = norm(X(:,:,count));
      magerr(1,count) = norm(X(:,:,count)- Xq(:,:,count));
  end

    SNRMX5 = 20*log10 (norm(magI)/norm(magerr));
  X2playmx5 = zeros(m,n,300);
  for count = 1:300 
 X2playmx5(:,:,count) = reshape(Xq(:,:,count),[m,n]);
  end 
  X2playmx5 = uint8(X2playmx5);
 % implay(X2playmx5)
   histogram(ers2)