
%% _Part(b)_
% unfinished 
% figure, imhist(img_gray,256), title('Original histogram')
% [n,y] = imhist(img_gray,256); 
% close all;
% [mm,nn] = size(img_gray);
% b = img(:,:,1);

% b(b <= 80) = 0;
% for ii = 1:mm
%     for jj = 1:nn
%         if b(ii,jj) >= 180 & b(ii,jj) <= 250
%             b(ii,jj) = b(ii,jj) +5;
%         end
%     end
% end

% figure, imhist(b,256), title('new histogram after cutoff')
%%
figure, plot(y,map), %title('CDF part a');
hold on; 

% [n,y] = imhist(b,256);
n(1) = 0;
map = cumsum(n);
map = map / max(map); % normalize 
% figure, %.Position = [100 100 540 400]; 
plot(y,map) 
% title('CDF after part b')
legend('CDF part a','CDF after part b')

figure()
imshow(b, [map map map])
title('New image part b')