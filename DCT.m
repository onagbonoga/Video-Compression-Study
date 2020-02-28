I = readData('output.avi');
I = double(I);
[m,n] = size(I(:,:,1));
% row = 0;
% col = 0;
% a = 0;
% b = 0;
% c = 0;
% d = 0;
% for count = 1:300
%     a = (8*row) + 1;
%     b = a + 7;
%     c =  (8*col) + 1;
%     d = c + 7;
%     X(a:b,c:d,count) = dct(p2(a:b,c:d,count));
%     row = row + 1;
%     col = col + 1;
% end
% for count = 1:300
% T = dctmtx(8); %returns an 8 x 8 DCT matrix
% dct = @(block_struct) T * block_struct.data * T'; 
% B(:,:,count) = blockproc(I(:,:,count),[8 8],dct);
% end
% %B = uint8(B);
% implay(B)
% x = B(:,:,3);
% for count = 1:300
% invdct = @(block_struct) T' * block_struct.data * T;
% I2(:,:,count) = blockproc(B(:,:,count),[8 8],invdct);
% end
% I2 = uint8(I2);
% implay(I2)
% I = uint8(I);
% implay(I)
dctmov = zeros(240,320,150);
for i = 1:15
   for  j= 1:20
       for p = 1:150
    dctmov(16*(i-1)+(1:16),16*(j-1)+(1:16),p) = dct2(I(16*(i-1)+(1:16), 16*(j-1)+(1:16),p));
       end 
   end 
end
meandctmov = mean(dctmov);
sigmadctmov = std(dctmov);
normdct = (dctmov-meandctmov)./sigmadctmov;

denomdct = (normdct + meandctmov).*sigmadctmov;
for i = 1:15
   for  j= 1:20
       for p = 1:150
    idctmov(16*(i-1)+(1:16),16*(j-1)+(1:16),p) = idct2(denomdct(16*(i-1)+(1:16), 16*(j-1)+(1:16),p));
       end 
   end 
end

implay(idctmov)
