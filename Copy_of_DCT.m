I = readData('output.avi');
I = double(I);
[m,n] = size(I(:,:,1));
for count = 1:300
T = dctmtx(8); %returns an 8 x 8 DCT matrix
dct = @(block_struct) T * block_struct.data * T'; 
DCT3(:,:,count) = blockproc(I(:,:,count),[8 8],dct);
end
DCT4 = DCT3;
DCT5 = DCT4;
%B = uint8(B);
implay(DCT3)
%%%%3 bit Quantization%%%%%%
%count3 = 1;
ppp = DCT3(:,:,3);
 for count1 = 1:300
    for count2 = 1:352
        for count3 = 1:288
            if DCT3(count3,count2,count1)>= 0 && DCT3(count3,count2,count1)<= 31
                DCT3(count3,count2,count1) = 16;
                 elseif DCT3(count3,count2,count1)>= 32 && DCT3(count3,count2,count1)<= 63
                DCT3(count3,count2,count1) = 48;
                elseif DCT3(count3,count2,count1)>= 64 && DCT3(count3,count2,count1)<= 95
                DCT3(count3,count2,count1) = 80;
                elseif DCT3(count3,count2,count1)>= 96 && DCT3(count3,count2,count1)<= 127
                DCT3(count3,count2,count1) = 112;
                elseif DCT3(count3,count2,count1)>= 128 && DCT3(count3,count2,count1)<= 159
                DCT3(count3,count2,count1) = 144;
                elseif DCT3(count3,count2,count1)>= 160 && DCT3(count3,count2,count1)<= 191
                DCT3(count3,count2,count1) = 176;
                elseif DCT3(count3,count2,count1)>= 192 && DCT3(count3,count2,count1)<= 223
                DCT3(count3,count2,count1) = 208;
                elseif DCT3(count3,count2,count1)>= 224 && DCT3(count3,count2,count1)<= 255
                DCT3(count3,count2,count1) = 240;  
            elseif DCT3(count3,count2,count1)>= 0 && DCT3(count3,count2,count1)<= -31
                DCT3(count3,count2,count1) = -16;
                 elseif DCT3(count3,count2,count1)>= -32 && DCT3(count3,count2,count1)<= -63
                DCT3(count3,count2,count1) = -48;
                elseif DCT3(count3,count2,count1)>= -64 && DCT3(count3,count2,count1)<= -95
                DCT3(count3,count2,count1) = -80;
                elseif DCT3(count3,count2,count1)>= -96 && DCT3(count3,count2,count1)<= -127
                DCT3(count3,count2,count1) = -112;
                elseif DCT3(count3,count2,count1)>= -128 && DCT3(count3,count2,count1)<= -159
                DCT3(count3,count2,count1) = -176;
                elseif DCT3(count3,count2,count1)>= -192 && DCT3(count3,count2,count1)<= -223
                DCT3(count3,count2,count1) = -208;
                elseif DCT3(count3,count2,count1)>= -224 && DCT3(count3,count2,count1)<= -255
                DCT3(count3,count2,count1) = -240; 
            end
    end
end

 end 

 %%%%%%%%%Quantization%%%%%%%%%%
 for count1 = 1:300
    for count2 = 1:352
        for count3 = 1:288
            if DCT3(count3,count2,count1)>= 0 && DCT3(count3,count2,count1)<= 15
                DCT4(count3,count2,count1) = 8;
                            elseif DCT3(count3,count2,count1)>= 17 && DCT3(count3,count2,count1)<= 32
                DCT4(count3,count2,count1) = 24;
            elseif DCT3(count3,count2,count1)>= 33 && DCT3(count3,count2,count1)<= 47
                DCT4(count3,count2,count1) = 40;
                            elseif DCT3(count3,count2,count1)>= 49 && DCT3(count3,count2,count1)<= 64
                DCT4(count3,count2,count1) = 56;
            elseif DCT3(count3,count2,count1)>= 65 && DCT3(count3,count2,count1)<= 79
                DCT4(count3,count2,count1) = 72;
                            elseif DCT3(count3,count2,count1)>= 81 && DCT3(count3,count2,count1)<= 96
                DCT4(count3,count2,count1) = 88;
            elseif DCT3(count3,count2,count1)>= 97 && DCT3(count3,count2,count1)<= 111
                DCT4(count3,count2,count1) = 104;
                            elseif DCT3(count3,count2,count1)>= 113 && DCT3(count3,count2,count1)<= 128
                DCT4(count3,count2,count1) = 120;
            elseif DCT3(count3,count2,count1)>= 129 && DCT3(count3,count2,count1)<= 143
                DCT4(count3,count2,count1) = 136;
                            elseif DCT3(count3,count2,count1)>= 145 && DCT3(count3,count2,count1)<= 160
                DCT4(count3,count2,count1) = 152;
            elseif DCT3(count3,count2,count1)>= 161 && DCT3(count3,count2,count1)<= 175
                DCT4(count3,count2,count1) = 168;
                         elseif DCT3(count3,count2,count1)>= 177 && DCT3(count3,count2,count1)<= 191
                DCT4(count3,count2,count1) = 184;
                            elseif DCT3(count3,count2,count1)>= 193 && DCT3(count3,count2,count1)<= 207
                DCT4(count3,count2,count1) = 200;
            elseif DCT3(count3,count2,count1)>= 209 && DCT3(count3,count2,count1)<= 223
                DCT4(count3,count2,count1) = 216;
                            elseif DCT3(count3,count2,count1)>= 225 && DCT3(count3,count2,count1)<= 239
                DCT4(count3,count2,count1) = 232;
            elseif DCT3(count3,count2,count1)>= 241 && DCT3(count3,count2,count1)<= 255
                DCT4(count3,count2,count1) = 248;
            elseif DCT3(count3,count2,count1)>= 0 && DCT3(count3,count2,count1)<= -15
                DCT4(count3,count2,count1) = -8;
                            elseif DCT3(count3,count2,count1)>= -17 && DCT3(count3,count2,count1)<= -32
                DCT4(count3,count2,count1) = -24;
            elseif DCT3(count3,count2,count1)>= -33 && DCT3(count3,count2,count1)<= -47
                DCT4(count3,count2,count1) = -40;
                            elseif DCT3(count3,count2,count1)>= -49 && DCT3(count3,count2,count1)<= -64
                DCT4(count3,count2,count1) = -56;
            elseif DCT3(count3,count2,count1)>= -65 && DCT3(count3,count2,count1)<= -79
                DCT4(count3,count2,count1) = -72;
                            elseif DCT3(count3,count2,count1)>= -81 && DCT3(count3,count2,count1)<= -96
                DCT4(count3,count2,count1) = -88;
            elseif DCT3(count3,count2,count1)>= -97 && DCT3(count3,count2,count1)<= -111
                DCT4(count3,count2,count1) = -104;
                            elseif DCT3(count3,count2,count1)>= -113 && DCT3(count3,count2,count1)<= -128
                DCT4(count3,count2,count1) = -120;
            elseif DCT3(count3,count2,count1)>= -129 && DCT3(count3,count2,count1)<= -143
                DCT4(count3,count2,count1) = -136;
                            elseif DCT3(count3,count2,count1)>= -145 && DCT3(count3,count2,count1)<= -160
                DCT4(count3,count2,count1) = -152;
            elseif DCT3(count3,count2,count1)>= -161 && DCT3(count3,count2,count1)<= -175
                DCT4(count3,count2,count1) = -168;
                         elseif DCT3(count3,count2,count1)>= -177 && DCT3(count3,count2,count1)<= -191
                DCT4(count3,count2,count1) = -184;
                            elseif DCT3(count3,count2,count1)>= -193 && DCT3(count3,count2,count1)<= -207
                DCT4(count3,count2,count1) = -200;
            elseif DCT3(count3,count2,count1)>= -209 && DCT3(count3,count2,count1)<= -223
                DCT4(count3,count2,count1) = -216;
                            elseif DCT3(count3,count2,count1)>= -225 && DCT3(count3,count2,count1)<= -239
                DCT4(count3,count2,count1) = -232;
            elseif DCT3(count3,count2,count1)>= -241 && DCT3(count3,count2,count1)<= -255
                DCT4(count3,count2,count1) = -248;
            end 
            end
    end
end
 %%%%%%%Quantization%%%
 for count1 = 1:300
    for count2 = 1:352
        for count3 = 288
           
           if DCT5(count3,count2,count1)>= 0 && DCT5(count3,count2,count1)<= 7
                DCT5(count3,count2,count1) = 4;
                            elseif DCT5(count3,count2,count1)>= 8 && DCT5(count3,count2,count1)<= 15
                DCT5(count3,count2,count1) = 12;
            elseif DCT5(count3,count2,count1)>= 16 && DCT5(count3,count2,count1)<= 23
                DCT5(count3,count2,count1) = 20;
                            elseif DCT5(count3,count2,count1)>= 24 && DCT5(count3,count2,count1)<= 31
                DCT5(count3,count2,count1) = 28;
            elseif DCT5(count3,count2,count1)>= 32 && DCT5(count3,count2,count1)<= 39
                DCT5(count3,count2,count1) = 36;
                            elseif DCT5(count3,count2,count1)>= 40 && DCT5(count3,count2,count1)<= 47
                DCT5(count3,count2,count1) = 44;
            elseif DCT5(count3,count2,count1)>= 48 && DCT5(count3,count2,count1)<= 55
                DCT5(count3,count2,count1) = 52;
                            elseif DCT5(count3,count2,count1)>= 56 && DCT5(count3,count2,count1)<= 63
                DCT5(count3,count2,count1) = 60;
            elseif DCT5(count3,count2,count1)>= 64 && DCT5(count3,count2,count1)<= 71
                DCT5(count3,count2,count1) = 68;
                            elseif DCT5(count3,count2,count1)>= 72 && DCT5(count3,count2,count1)<= 79
                DCT5(count3,count2,count1) = 76;
            elseif DCT5(count3,count2,count1)>= 80 && DCT5(count3,count2,count1)<= 87
                DCT5(count3,count2,count1) = 84;
                         elseif DCT5(count3,count2,count1)>= 88 && DCT5(count3,count2,count1)<= 95
                DCT5(count3,count2,count1) = 92;
                            elseif DCT5(count3,count2,count1)>= 96 && DCT5(count3,count2,count1)<= 103
                DCT5(count3,count2,count1) = 100;
            elseif DCT5(count3,count2,count1)>= 104 && DCT5(count3,count2,count1)<= 111
                DCT5(count3,count2,count1) = 108;
                            elseif DCT5(count3,count2,count1)>= 112 && DCT5(count3,count2,count1)<= 119
                DCT5(count3,count2,count1) = 116;
            elseif DCT5(count3,count2,count1)>= 120 && DCT5(count3,count2,count1)<= 127
                DCT5(count3,count2,count1) = 124;
           elseif DCT5(count3,count2,count1)>= 128 && DCT5(count3,count2,count1)<= 135
                DCT5(count3,count2,count1) = 132;
                            elseif DCT5(count3,count2,count1)>= 136 && DCT5(count3,count2,count1)<= 143
                DCT5(count3,count2,count1) = 140;
            elseif DCT5(count3,count2,count1)>= 144 && DCT5(count3,count2,count1)<= 151
                DCT5(count3,count2,count1) = 148;
                            elseif DCT5(count3,count2,count1)>= 152 && DCT5(count3,count2,count1)<= 159
                DCT5(count3,count2,count1) = 156;
            elseif DCT5(count3,count2,count1)>= 160 && DCT5(count3,count2,count1)<= 167
                DCT5(count3,count2,count1) = 164;
                            elseif DCT5(count3,count2,count1)>= 168 && DCT5(count3,count2,count1)<= 175
                DCT5(count3,count2,count1) = 172;
            elseif DCT5(count3,count2,count1)>= 176 && DCT5(count3,count2,count1)<= 183
                DCT5(count3,count2,count1) = 180;
                            elseif DCT5(count3,count2,count1)>= 184 && DCT5(count3,count2,count1)<= 191
                DCT5(count3,count2,count1) = 188;
            elseif DCT5(count3,count2,count1)>= 192 && DCT5(count3,count2,count1)<= 199
                DCT5(count3,count2,count1) = 196;
                            elseif DCT5(count3,count2,count1)>= 200 && DCT5(count3,count2,count1)<= 207
                DCT5(count3,count2,count1) = 204;
            elseif DCT5(count3,count2,count1)>= 208 && DCT5(count3,count2,count1)<= 215
                DCT5(count3,count2,count1) = 212;
                         elseif DCT5(count3,count2,count1)>= 216 && DCT5(count3,count2,count1)<= 223
                DCT5(count3,count2,count1) = 220;
                            elseif DCT5(count3,count2,count1)>= 224 && DCT5(count3,count2,count1)<= 231
                DCT5(count3,count2,count1) = 228;
            elseif DCT5(count3,count2,count1)>= 232 && DCT5(count3,count2,count1)<= 239
                DCT5(count3,count2,count1) = 236;
                            elseif DCT5(count3,count2,count1)>= 240 && DCT5(count3,count2,count1)<= 247
                DCT5(count3,count2,count1) = 244;
            elseif DCT5(count3,count2,count1)>= 248 && DCT5(count3,count2,count1)<= 255
                DCT5(count3,count2,count1) = 252;
           elseif DCT5(count3,count2,count1)>= 0 && DCT5(count3,count2,count1)<= -7
                DCT5(count3,count2,count1) = -4;
                            elseif DCT5(count3,count2,count1)>= -8 && DCT5(count3,count2,count1)<= -15
                DCT5(count3,count2,count1) = -12;
            elseif DCT5(count3,count2,count1)>= -16 && DCT5(count3,count2,count1)<= -23
                DCT5(count3,count2,count1) = -20;
                            elseif DCT5(count3,count2,count1)>= -24 && DCT5(count3,count2,count1)<= -31
                DCT5(count3,count2,count1) = -28;
            elseif DCT5(count3,count2,count1)>= -32 && DCT5(count3,count2,count1)<= -39
                DCT5(count3,count2,count1) = -36;
                            elseif DCT5(count3,count2,count1)>= -40 && DCT5(count3,count2,count1)<= -47
                DCT5(count3,count2,count1) = -44;
            elseif DCT5(count3,count2,count1)>= -48 && DCT5(count3,count2,count1)<= -55
                DCT5(count3,count2,count1) = -52;
                            elseif DCT5(count3,count2,count1)>= -56 && DCT5(count3,count2,count1)<= -63
                DCT5(count3,count2,count1) = -60;
            elseif DCT5(count3,count2,count1)>= -64 && DCT5(count3,count2,count1)<= -71
                DCT5(count3,count2,count1) = -68;
                            elseif DCT5(count3,count2,count1)>= -72 && DCT5(count3,count2,count1)<= -79
                DCT5(count3,count2,count1) = -76;
            elseif DCT5(count3,count2,count1)>= -80 && DCT5(count3,count2,count1)<= -87
                DCT5(count3,count2,count1) = -84;
                         elseif DCT5(count3,count2,count1)>= -88 && DCT5(count3,count2,count1)<= -95
                DCT5(count3,count2,count1) = -92;
                            elseif DCT5(count3,count2,count1)>= -96 && DCT5(count3,count2,count1)<= -103
                DCT5(count3,count2,count1) = -100;
            elseif DCT5(count3,count2,count1)>= -104 && DCT5(count3,count2,count1)<= -111
                DCT5(count3,count2,count1) = -108;
                            elseif DCT5(count3,count2,count1)>= -112 && DCT5(count3,count2,count1)<= -119
                DCT5(count3,count2,count1) = -116;
            elseif DCT5(count3,count2,count1)>= -120 && DCT5(count3,count2,count1)<= -127
                DCT5(count3,count2,count1) = -124;
           elseif DCT5(count3,count2,count1)>= -128 && DCT5(count3,count2,count1)<= -135
                DCT5(count3,count2,count1) = -132;
                            elseif DCT5(count3,count2,count1)>= -136 && DCT5(count3,count2,count1)<= -143
                DCT5(count3,count2,count1) = -140;
            elseif DCT5(count3,count2,count1)>= -144 && DCT5(count3,count2,count1)<= -151
                DCT5(count3,count2,count1) = -148;
                            elseif DCT5(count3,count2,count1)>= -152 && DCT5(count3,count2,count1)<= -159
                DCT5(count3,count2,count1) = -156;
            elseif DCT5(count3,count2,count1)>= -160 && DCT5(count3,count2,count1)<= -167
                DCT5(count3,count2,count1) = -164;
                            elseif DCT5(count3,count2,count1)>= -168 && DCT5(count3,count2,count1)<= -175
                DCT5(count3,count2,count1) = -172;
            elseif DCT5(count3,count2,count1)>= -176 && DCT5(count3,count2,count1)<= -183
                DCT5(count3,count2,count1) = -180;
                            elseif DCT5(count3,count2,count1)>= -184 && DCT5(count3,count2,count1)<= -191
                DCT5(count3,count2,count1) = -188;
            elseif DCT5(count3,count2,count1)>= -192 && DCT5(count3,count2,count1)<= -199
                DCT5(count3,count2,count1) = -196;
                            elseif DCT5(count3,count2,count1)>= -200 && DCT5(count3,count2,count1)<= -207
                DCT5(count3,count2,count1) = -204;
            elseif DCT5(count3,count2,count1)>= -208 && DCT5(count3,count2,count1)<= -215
                DCT5(count3,count2,count1) = -212;
                         elseif DCT5(count3,count2,count1)>= -216 && DCT5(count3,count2,count1)<= -223
                DCT5(count3,count2,count1) = -220;
                            elseif DCT5(count3,count2,count1)>= -224 && DCT5(count3,count2,count1)<= -231
                DCT5(count3,count2,count1) = -228;
            elseif DCT5(count3,count2,count1)>= -232 && DCT5(count3,count2,count1)<= -239
                DCT5(count3,count2,count1) = -236;
                            elseif DCT5(count3,count2,count1)>= -240 && DCT5(count3,count2,count1)<= -247
                DCT5(count3,count2,count1) = -244;
            elseif DCT5(count3,count2,count1)>= -248 && DCT5(count3,count2,count1)<= -255
                DCT5(count3,count2,count1) = -252;
                
            end
        end
    end
end
for count = 1:300
invdct = @(block_struct) T' * block_struct.data * T;
I3(:,:,count) = blockproc(DCT3(:,:,count),[8 8],invdct);
end
for count = 1:300
invdct = @(block_struct) T' * block_struct.data * T;
I4(:,:,count) = blockproc(DCT4(:,:,count),[8 8],invdct);
end
for count = 1:300
invdct = @(block_struct) T' * block_struct.data * T;
I5(:,:,count) = blockproc(DCT5(:,:,count),[8 8],invdct);
end


 %%%%%%%%%%%%%%%%%%%%%%SNR%%%%%%%%%%%%%%
  I3 = double(I3);
  I4 = double(I4);
  I5 = double(I5);
  magI = zeros([1,300]);
  magerr3 = zeros([1,300]);
  magerr4 = zeros([1,300]);
  magerr5 = zeros([1,300]);
  for count = 1:300
      magI(1,count) = norm(I(:,:,count));
      magerr3(1,count) = norm(I(:,:,count)- I3(:,:,count));
      magerr4(1,count) = norm(I(:,:,count)- I4(:,:,count));
      magerr5(1,count) = norm(I(:,:,count)- I5(:,:,count));
  end

    SNRDCT3 = 20*log10 (norm(magI)/norm(magerr3));
    SNRDCT4 = 20*log10 (norm(magI)/norm(magerr4));
    SNRDCT5 = 20*log10 (norm(magI)/norm(magerr5));


I3 = uint8(I3);
implay(I3)
I4 = uint8(I4);
implay(I4)
I5 = uint8(I5);
implay(I5)







