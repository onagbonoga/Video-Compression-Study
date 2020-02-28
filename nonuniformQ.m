p2 = readData('output.avi');  %load the video 
p2 = double(p2);
[m,n] = size(p2(:,:,1));

%  % I want to have all the pixel values in one row
 for count = 1:300
 X(:,:,count) = reshape(p2(:,:,count),[1,(m*n)]);
 end 
 mp  = max(abs(X));

 
 %%A-law
 A = 87.6;
 B = 1 + log(A);
 y1 = zeros([1,m*n,300]);
  for count = 1:300
      for count2 = 1:m*n
    if X(:,count2,count)/mp(:,:,count) >=0 && X(:,count2,count)/mp(:,:,count) <= 1/A
       y1(:,count2,count) = (A/B)*(X(:,count2,count)/mp(:,:,count));
    elseif X(:,count2,count)/mp(:,:,count) >=1/A && X(:,count2,count)/mp(:,:,count) <= 1
      y1(:,count2,count) = 1/B*(1+log(A*X(:,count2,count)/mp(:,:,count)));
    end
      end 
  end
   %%%u law
   u =255;
   C = 1/(log(1+u));
   y2 = zeros([1,m*n,300]);
   for count = 1:300
   for count2 = 1:m*n
        y2(:,count2,count) = C*log(1 + ((u*X(:,count2,count))/mp(:,:,count)));
   end
   end
     %%%%%%%%%%%%%%%%%%%%%%SNR%%%%%%%%%%%%%%

 %y1 = double(y1);
  for count = 1:300
      magI(1,count) = norm(X(:,:,count));
      magerr(1,count) = norm(X(:,:,count)- y1(:,:,count));
  end

    SNRAL = 20*log10 (norm(magI)/norm(magerr));
  Alaw = zeros(m,n,300);
    for count = 1:300
      magI(1,count) = norm(X(:,:,count));
      magerr(1,count) = norm(X(:,:,count)- y2(:,:,count));
     end
    
  SNRuL = 20*log10 (norm(magI)/norm(magerr));
  Alaw = zeros(m,n,300);
  ulaw = zeros(m,n,300);
  for count = 1:300 % I can play the error signal and the predictor if I pass them into this for loop 
 Alaw(:,:,count) = reshape(y1(:,:,count),[m,n]);
  end 
 for count = 1:300 % I can play the error signal and the predictor if I pass them into this for loop 
 ulaw(:,:,count) = reshape(y2(:,:,count),[m,n]);
 end 
    %X2playif5 = im2double(X2playif5);
  %implay(ulaw)
  figure('Name','ulaw');
  histogram(ulaw)
  figure('Name','Alaw');
  histogram(Alaw)
  