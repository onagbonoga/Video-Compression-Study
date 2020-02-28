p2 = readData('output.avi');  %load the video and converts to double
p2 = double(p2);
[m,n] = size(p2(:,:,1));
load sample.mat 
%  % I want to have all the pixel values in one row
 for count = 1:300
 X(:,:,count) = reshape(p2(:,:,count),[1,(m*n)]);
 end 
%The for loop is to store the next values of X in Y
count = 1;
Y = zeros(1,m*n,300);
for count1 = 1:300-1
for count = 1:((m*n))
    Y(:,count,count1) = X(:,count,count1+1);
end
end
for count1 = 1:((m*n))
  Y(1,count,300) = X(1,count,1);    %I did this so i dont lose the information in X(1)
end

%calculating the error signal for each frame
 XY = X.*Y;     %Multiplying the X and Y arrays together
Ex = zeros(1,m*n,300);
Ey = zeros(1,m*n,300);
Exy = zeros(1,m*n,300);
sigx = zeros(1,m*n,300);
sigy = zeros(1,m*n,300);
 for count = 1:300
 Ex(1,1,count) = mean(X(:,:,count));
 Ey(1,1,count) = mean(Y(:,:,count));
 Exy(1,1,count) = mean(XY(:,:,count));
 sigx(1,1,count) = std(X(:,:,count)); %calculating the standard deviations
 sigy(1,1,count) = std(Y(:,:,count));
 end 
 for count1 = 1:300
  rho(1,1,count1) = (Exy(1,1,count1) - (Ex(1,1,count1) * Ey(1,1,count1)))/(sigx(1,1,count1) * sigy(1,1,count1));
 end 
Xhat = zeros([1,m*n,300]);
for count = 1:300
    Xhat(1,:,count) = ((rho(1,1,count)*(Y(1,:,count)-Ey(1,1,count))*sigx(1,1,count))/sigy(1,1,count)) + Ex(1,1,count);
end
% for count = 1:300
%     Xhat(1,:,count) = ((rho(1,1,count)*sigx(1,1,count)/sigy(1,1,count))*Y(1,:,count)) + Ex(1,1,count) - ((rho(1,1,count)*sigx(1,1,count))/sigy(1,1,count));
% end
 ers2 = X - Xhat; %error signal
 %%%%%%%5-bit Quantization%%%%%%
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

    SNRIF5 = 20*log10 (norm(magI)/norm(magerr));
  X2playif5 = zeros(m,n,300);
  for count = 1:300 
 X2playif5(:,:,count) = reshape(Xq(:,:,count),[m,n]);
  end 
  X2playif5 = uint8(X2playif5);
% implay(X2playif5)
%%Plotting error signal histogram
histogram(ers2)
