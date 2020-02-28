 p2 = readData('output.avi');  %load the video and converts to double
 p2 = double(p2);
 [m,n] = size(p2(:,:,1));
%  % I want to have all the pixel values in one row
 for count = 1:300
 X(:,:,count) = reshape(p2(:,:,count),[1,(m*n)]);
 end 
%The for loop is to store the next values of X in Y
count = 1;
for count1 = 1:300
for count = 1:((m*n)-1)
    Y(1,count,count1) = X(1,count+1,count1);
end
end
for count1 = 1:300
  Y(1,101376,count1) = X(1,1,count1);    %I did this so i dont lose the information in X(1)
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
Xhat = zeros([1,m*n,300]);
for count = 1:300
    Xhat(1,:,count) = ((rho(1,1,count)*(Y(1,:,count)-Ey(1,1,count))*sigx(1,1,count))/sigy(1,1,count)) + Ex(1,1,count);
end
% for count = 1:300
%     Xhat(1,:,count) = ((rho(1,1,count)*sigx(1,1,count)/sigy(1,1,count))*Y(1,:,count)) + Ex(1,1,count) - ((rho(1,1,count)*sigx(1,1,count))/sigy(1,1,count));
% end
 ers2 = X - Xhat; %error signal
 %%%%%%%%%Quantization%%%%%%%%%%
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
%  noise = Xq - X;
%  Px = 0;
%  Pn = 0;
%  for count = 1:300
%      for count1 = 1:m*n
%  Px = (X(1,count1,count))^2 + Px;
%  Pn = (noise(1,count1,count))^2 + Pn;
%      end
%  end
%  SNR4 = (Px/(m*n*300))/((Pn/m*n*300));
Xq = double(Xq);
  for count = 1:300
      magI(1,count) = norm(X(:,:,count));
      magerr(1,count) = norm(X(:,:,count)- Xq(:,:,count));
  end

    SNR4 = 20*log10 (norm(magI)/norm(magerr));
  
  for count = 1:300  
 X2play4(:,:,count) = reshape(Xq(:,:,count),[m,n]);
  end 
  X2play4 = uint8(X2play4);
 %implay(X2play4)
%%Plotting error signal histogram
%histogram(ers2)


 %implay(X2playif5)
