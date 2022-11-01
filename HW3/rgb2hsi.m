function [h,s,i] = rgb2hsi(r,g,b)
% function [h,s,i] = rgb2hsi(r,g,b)
r = double(r)/255;
g = double(g)/255;
b = double(b)/255;

i = eps + (r + g + b)/3; % Kludged to avoid problems in saturation
i = i / max(max(i));

num = .5 * ((r - g) + (r - b));
den = eps + sqrt((r - g) .* (r - g) + (r - b) .* (g - b)); %Kludged

if den == 0
   h = 0 % is this the hue we want? It doesn't matter since s = 0?
else
   h = acos(num ./ den);
end

tst = (b ./ i) > (g ./ i);
h = (2 * pi - h) .* tst + h .* (1 - tst);
h = h/(2 * pi);


s = 1 - min(r,min(g,b)) ./ i;