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
%%%%%%%%% 4 Bit Quantization%%%%%%%%%%
 count3 = 1;
 for count1 = 1:300
    for count2 = 1:101376
            if ers2(count3,count2,count1)>= 0 && ers2(count3,count2,count1)<= 15
                ers2(count3,count2,count1) = 8;
                            elseif ers2(count3,count2,count1)>= 17 && ers2(count3,count2,count1)<= 32
                ers2(count3,count2,count1) = 24;
            elseif ers2(count3,count2,count1)>= 33 && ers2(count3,count2,count1)<= 47
                ers2(count3,count2,count1) = 40;
                            elseif ers2(count3,count2,count1)>= 49 && ers2(count3,count2,count1)<= 64
                ers2(count3,count2,count1) = 56;
            elseif ers2(count3,count2,count1)>= 65 && ers2(count3,count2,count1)<= 79
                ers2(count3,count2,count1) = 72;
                            elseif ers2(count3,count2,count1)>= 81 && ers2(count3,count2,count1)<= 96
                ers2(count3,count2,count1) = 88;
            elseif ers2(count3,count2,count1)>= 97 && ers2(count3,count2,count1)<= 111
                ers2(count3,count2,count1) = 104;
                            elseif ers2(count3,count2,count1)>= 113 && ers2(count3,count2,count1)<= 128
                ers2(count3,count2,count1) = 120;
            elseif ers2(count3,count2,count1)>= 129 && ers2(count3,count2,count1)<= 143
                ers2(count3,count2,count1) = 136;
                            elseif ers2(count3,count2,count1)>= 145 && ers2(count3,count2,count1)<= 160
                ers2(count3,count2,count1) = 152;
            elseif ers2(count3,count2,count1)>= 161 && ers2(count3,count2,count1)<= 175
                ers2(count3,count2,count1) = 168;
                         elseif ers2(count3,count2,count1)>= 177 && ers2(count3,count2,count1)<= 191
                ers2(count3,count2,count1) = 184;
                            elseif ers2(count3,count2,count1)>= 193 && ers2(count3,count2,count1)<= 207
                ers2(count3,count2,count1) = 200;
            elseif ers2(count3,count2,count1)>= 209 && ers2(count3,count2,count1)<= 223
                ers2(count3,count2,count1) = 216;
                            elseif ers2(count3,count2,count1)>= 225 && ers2(count3,count2,count1)<= 239
                ers2(count3,count2,count1) = 232;
            elseif ers2(count3,count2,count1)>= 241 && ers2(count3,count2,count1)<= 255
                ers2(count3,count2,count1) = 248;
            elseif ers2(count3,count2,count1)>= 0 && ers2(count3,count2,count1)<= -15
                ers2(count3,count2,count1) = -8;
                            elseif ers2(count3,count2,count1)>= -17 && ers2(count3,count2,count1)<= -32
                ers2(count3,count2,count1) = -24;
            elseif ers2(count3,count2,count1)>= -33 && ers2(count3,count2,count1)<= -47
                ers2(count3,count2,count1) = -40;
                            elseif ers2(count3,count2,count1)>= -49 && ers2(count3,count2,count1)<= -64
                ers2(count3,count2,count1) = -56;
            elseif ers2(count3,count2,count1)>= -65 && ers2(count3,count2,count1)<= -79
                ers2(count3,count2,count1) = -72;
                            elseif ers2(count3,count2,count1)>= -81 && ers2(count3,count2,count1)<= -96
                ers2(count3,count2,count1) = -88;
            elseif ers2(count3,count2,count1)>= -97 && ers2(count3,count2,count1)<= -111
                ers2(count3,count2,count1) = -104;
                            elseif ers2(count3,count2,count1)>= -113 && ers2(count3,count2,count1)<= -128
                ers2(count3,count2,count1) = -120;
            elseif ers2(count3,count2,count1)>= -129 && ers2(count3,count2,count1)<= -143
                ers2(count3,count2,count1) = -136;
                            elseif ers2(count3,count2,count1)>= -145 && ers2(count3,count2,count1)<= -160
                ers2(count3,count2,count1) = -152;
            elseif ers2(count3,count2,count1)>= -161 && ers2(count3,count2,count1)<= -175
                ers2(count3,count2,count1) = -168;
                         elseif ers2(count3,count2,count1)>= -177 && ers2(count3,count2,count1)<= -191
                ers2(count3,count2,count1) = -184;
                            elseif ers2(count3,count2,count1)>= -193 && ers2(count3,count2,count1)<= -207
                ers2(count3,count2,count1) = -200;
            elseif ers2(count3,count2,count1)>= -209 && ers2(count3,count2,count1)<= -223
                ers2(count3,count2,count1) = -216;
                            elseif ers2(count3,count2,count1)>= -225 && ers2(count3,count2,count1)<= -239
                ers2(count3,count2,count1) = -232;
            elseif ers2(count3,count2,count1)>= -241 && ers2(count3,count2,count1)<= -255
                ers2(count3,count2,count1) = -248;
   
            end
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

    SNRMX4 = 20*log10 (norm(magI)/norm(magerr));
  X2playmx4 = zeros(m,n,300);
  for count = 1:300 
 X2playmx4(:,:,count) = reshape(Xq(:,:,count),[m,n]);
  end 
  X2playmx4 = uint8(X2playmx4);
 % implay(X2playmx4)
   histogram(ers2)