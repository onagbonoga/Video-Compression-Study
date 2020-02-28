p = readData('output.avi');
% q = readData('output.avi');
% p = readData('output.avi');
% p = readData('output.avi');
% p = readData('output.avi');
p2 = p;
r2 = p;
s2 = p;
t2 = p;
[m,n] = size(p2(:,:,1));
%16 quantization levels
for count1 = 1:300
    for count2 = 1:352
        for count3 = 1:288
            if p(count3,count2,count1)>= 0 && p(count3,count2,count1)<= 15
                p2(count3,count2,count1) = 8;
                            elseif p(count3,count2,count1)>= 17 && p(count3,count2,count1)<= 32
                p2(count3,count2,count1) = 24;
            elseif p(count3,count2,count1)>= 33 && p(count3,count2,count1)<= 47
                p2(count3,count2,count1) = 40;
                            elseif p(count3,count2,count1)>= 49 && p(count3,count2,count1)<= 64
                p2(count3,count2,count1) = 56;
            elseif p(count3,count2,count1)>= 65 && p(count3,count2,count1)<= 79
                p2(count3,count2,count1) = 72;
                            elseif p(count3,count2,count1)>= 81 && p(count3,count2,count1)<= 96
                p2(count3,count2,count1) = 88;
            elseif p(count3,count2,count1)>= 97 && p(count3,count2,count1)<= 111
                p2(count3,count2,count1) = 104;
                            elseif p(count3,count2,count1)>= 113 && p(count3,count2,count1)<= 128
                p2(count3,count2,count1) = 120;
            elseif p(count3,count2,count1)>= 129 && p(count3,count2,count1)<= 143
                p2(count3,count2,count1) = 136;
                            elseif p(count3,count2,count1)>= 145 && p(count3,count2,count1)<= 160
                p2(count3,count2,count1) = 152;
            elseif p(count3,count2,count1)>= 161 && p(count3,count2,count1)<= 175
                p2(count3,count2,count1) = 168;
                         elseif p(count3,count2,count1)>= 177 && p(count3,count2,count1)<= 191
                p2(count3,count2,count1) = 184;
                            elseif p(count3,count2,count1)>= 193 && p(count3,count2,count1)<= 207
                p2(count3,count2,count1) = 200;
            elseif p(count3,count2,count1)>= 209 && p(count3,count2,count1)<= 223
                p2(count3,count2,count1) = 216;
                            elseif p(count3,count2,count1)>= 225 && p(count3,count2,count1)<= 239
                p2(count3,count2,count1) = 232;
            elseif p(count3,count2,count1)>= 241 && p(count3,count2,count1)<= 255
                p2(count3,count2,count1) = 248;
   
            end
        end
    end
end
 %%%%%%%%%%%%%%%%%%%%%%SNR%%%%%%%%%%%%%%
p2 = uint8(p2);
 noise = p2 - p;
 Px = 0;
 Pn = 0;
 for count = 1:300
     for count2 = 1:352
         for count3 = 1:288
 Px = (p(count3,count2,count))^2 + Px;
 Pn = (noise(count3,count2,count))^2 + Pn;
         end 
     end
 end
 SNRpcm4 = (Px/m*n*300)/(Pn/m*n*300);
%8 quantization levels
for count1 = 1:300
    for count2 = 1:352
        for count3 = 1:288
            if p(count3,count2,count1)>= 0 && p(count3,count2,count1)<= 31
                r2(count3,count2,count1) = 16;
                 elseif p(count3,count2,count1)>= 32 && p(count3,count2,count1)<= 63
                r2(count3,count2,count1) = 48;
                elseif p(count3,count2,count1)>= 64 && p(count3,count2,count1)<= 95
                r2(count3,count2,count1) = 80;
                elseif p(count3,count2,count1)>= 96 && p(count3,count2,count1)<= 127
                r2(count3,count2,count1) = 112;
                elseif p(count3,count2,count1)>= 128 && p(count3,count2,count1)<= 159
                r2(count3,count2,count1) = 176;
                elseif p(count3,count2,count1)>= 192 && p(count3,count2,count1)<= 223
                r2(count3,count2,count1) = 208;
                elseif p(count3,count2,count1)>= 224 && p(count3,count2,count1)<= 255
                r2(count3,count2,count1) = 240;
                
            end
        end
    end
end
 %%%%%%%%%%%%%%%%%%%%%%SNR%%%%%%%%%%%%%%
 r2 = uint8(r2);
 noise = r2 - p;
 Px = 0;
 Pn = 0;
 for count = 1:300
     for count2 = 1:352
         for count3 = 1:288
 Px = (p(count3,count2,count))^2 + Px;
 Pn = (noise(count3,count2,count))^2 + Pn;
         end 
     end
 end
 SNRpcm3 = (Px/m*n*300)/(Pn/m*n*300);

%4 quantization levels
for count1 = 1:300
    for count2 = 1:352
        for count3 = 1:288
            if p(count3,count2,count1)>= 0 && p(count3,count2,count1)<= 63
                s2(count3,count2,count1) = 32;
                 elseif p(count3,count2,count1)>= 64 && p(count3,count2,count1)<= 127
                s2(count3,count2,count1) = 128;
                 elseif p(count3,count2,count1)>= 128 && p(count3,count2,count1)<= 191
                s2(count3,count2,count1) = 160;
                 elseif p(count3,count2,count1)>= 192 && p(count3,count2,count1)<= 255
                s2(count3,count2,count1) = 224;
            end
        end
    end
end

 %%%%%%%%%%%%%%%%%%%%%%SNR%%%%%%%%%%%%%%
 s2 = uint8(s2);
 noise = s2 - p;
 Px = 0;
 Pn = 0;
 for count = 1:300
     for count2 = 1:352
         for count3 = 1:288
 Px = (p(count3,count2,count))^2 + Px;
 Pn = (noise(count3,count2,count))^2 + Pn;
         end 
     end
 end
 SNRpcm2 = (Px/m*n*300)/(Pn/m*n*300);
 
%2 quantization levels
for count1 = 1:300
    for count2 = 1:352
        for count3 = 1:288
            if p(count3,count2,count1)>= 0 && p(count3,count2,count1)<= 127
                t2(count3,count2,count1) = 32;
                 elseif p(count3,count2,count1)>= 128 && p(count3,count2,count1)<= 255
                t2(count3,count2,count1) = 192;
            end
        end
    end
end
 %%%%%%%%%%%%%%%%%%%%%%SNR%%%%%%%%%%%%%%
 t2 = uint8(t2);
 noise =t2 - p;
 Px = 0;
 Pn = 0;
 for count = 1:300
     for count2 = 1:352
         for count3 = 1:288
 Px = (p(count3,count2,count))^2 + Px;
 Pn = (noise(count3,count2,count))^2 + Pn;
         end 
     end
 end
 SNRpcm1 = (Px/m*n*300)/(Pn/m*n*300);
 

