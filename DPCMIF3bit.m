 p2 = readData('output.avi');  %load the video and converts to double
p2 = double(p2);
[m,n] = size(p2(:,:,1)); 
%  % I want to have all the pixel values in one row
 for count = 1:300
 X(:,:,count) = reshape(p2(:,:,count),[1,(m*n)]);
 end 
%The for loop is to store the next values of X in Y
count = 1;
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
for count = 1:300
    Xhat(1,:,count) = ((rho(1,1,count)*(Y(1,:,count)-Ey(1,1,count))*sigx(1,1,count))/sigy(1,1,count)) + Ex(1,1,count);
end
% for count = 1:300
%     Xhat(1,:,count) = ((rho(1,1,count)*sigx(1,1,count)/sigy(1,1,count))*Y(1,:,count)) + Ex(1,1,count) - ((rho(1,1,count)*sigx(1,1,count))/sigy(1,1,count));
% end
 ers2 = X - Xhat; %error signal
  %%%3 Bit Quantization%%%
 count3 = 1;
 for count1 = 1:300
    for count2 = 1:101376
            if ers2(count3,count2,count1)>= 0 && ers2(count3,count2,count1)<= 31
                ers2(count3,count2,count1) = 16;
                 elseif ers2(count3,count2,count1)>= 32 && ers2(count3,count2,count1)<= 63
                ers2(count3,count2,count1) = 48;
                elseif ers2(count3,count2,count1)>= 64 && ers2(count3,count2,count1)<= 95
                ers2(count3,count2,count1) = 80;
                elseif ers2(count3,count2,count1)>= 96 && ers2(count3,count2,count1)<= 127
                ers2(count3,count2,count1) = 112;
                elseif ers2(count3,count2,count1)>= 128 && ers2(count3,count2,count1)<= 159
                ers2(count3,count2,count1) = 144;
                elseif ers2(count3,count2,count1)>= 160 && ers2(count3,count2,count1)<= 191
                ers2(count3,count2,count1) = 176;
                elseif ers2(count3,count2,count1)>= 192 && ers2(count3,count2,count1)<= 223
                ers2(count3,count2,count1) = 208;
                elseif ers2(count3,count2,count1)>= 224 && ers2(count3,count2,count1)<= 255
                ers2(count3,count2,count1) = 240;  
            elseif ers2(count3,count2,count1)>= 0 && ers2(count3,count2,count1)<= -31
                ers2(count3,count2,count1) = -16;
                 elseif ers2(count3,count2,count1)>= -32 && ers2(count3,count2,count1)<= -63
                ers2(count3,count2,count1) = -48;
                elseif ers2(count3,count2,count1)>= -64 && ers2(count3,count2,count1)<= -95
                ers2(count3,count2,count1) = -80;
                elseif ers2(count3,count2,count1)>= -96 && ers2(count3,count2,count1)<= -127
                ers2(count3,count2,count1) = -112;
                elseif ers2(count3,count2,count1)>= -128 && ers2(count3,count2,count1)<= -159
                ers2(count3,count2,count1) = -144;
                elseif ers2(count3,count2,count1)>= -160 && ers2(count3,count2,count1)<= -191
                ers2(count3,count2,count1) = -176;
                elseif ers2(count3,count2,count1)>= -192 && ers2(count3,count2,count1)<= -223
                ers2(count3,count2,count1) = -208;
                elseif ers2(count3,count2,count1)>= -224 && ers2(count3,count2,count1)<= -255
                ers2(count3,count2,count1) = -240; 
            end
    end
 end %reciever side
 Xq = ers2 + Xhat;
 %%%%%%%%%%%%%%%%%%%%%%SNR%%%%%%%%%%%%%%

 Xq = double(Xq);
  for count = 1:300
      magI(1,count) = norm(X(:,:,count));
      magerr(1,count) = norm(X(:,:,count)- Xq(:,:,count));
  end

    SNRIF3 = 20*log10 (norm(magI)/norm(magerr)); 
%%%%%%%%%%%%%%reshaping the array%%%%%%%%%%%%55
  for count = 1:300 
 X2playif3(:,:,count) = reshape(Xq(:,:,count),[m,n]);
  end 
  X2playif3 = uint8(X2playif3);
% implay(X2playif3)
%%Plotting error signal histogram
histogram(ers2)
