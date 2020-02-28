I = readData('output.avi');
I = double(I);
[m,n] = size(I(:,:,1));
DCT3 = zeros([288,352,300]);
I3 = zeros([288,352,300]);

for count = 1:300
T = dctmtx(8); %returns an 8 x 8 DCT matrix
dct = @(block_struct) T * block_struct.data * T'; 
DCT3(:,:,count) = blockproc(I(:,:,count),[8 8],dct);
end


for count1 = 1:8
    for count2 = 1:8
 tt(count1,count2) = C(count1)*C(count2)/4;
    end
end 

for count1 = 1:7:281
    for count2 = 1:7:345
        norm (count1:count1+7,count2:count2+7) = tt;
    end
end
norm(:,352) = norm(:,351);

for count = 1:300
DCTnorm(:,:,count) = DCT3(:,:,count).*norm;
end
%%%%quantization%%%%
for count = 1:300
    DCTnormq(:,:,count) = PCMfun(DCTnorm(:,:,count),8);
end
%%%%denormalization%%%
for count1 = 1:8
    for count2 = 1:8
 ttt(count1,count2) = 4/(C(count1)*C(count2));
    end
end 

for count1 = 1:7:281
    for count2 = 1:7:345
        denorm (count1:count1+7,count2:count2+7) = ttt;
    end
end
denorm(:,352) = denorm(:,351);

for count = 1:300
DCTdenorm(:,:,count) = DCTnorm(:,:,count).*denorm;
end
%%%%inverse DCT%%%%%
count2 = 1
for count = 1:300
invdct = @(block_struct) T' * block_struct.data * T;
I3(:,:,count) = blockproc(DCTdenorm(:,:,count),[8 8],invdct);
end

I3 = uint8(I3);
I = uint8(I);
%implay(I3)
histogram(DCTnorm)
