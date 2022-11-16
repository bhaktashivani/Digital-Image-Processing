%% Problem 2 Pre-filtering to Reduce Aliasing before Sampling

close all; clc; clear; 
barbara = read(Tiff('barbara.tiff', 'r'));

figure, 
subplot(1,2,1), imshow(barbara), title('barbara original');

baby = read(Tiff('baby.tiff', 'r'));
subplot(1,2,2), imshow(baby), title('baby original');

%%
close all; 
barbBig = barbara(1:512,37:548);
figure, 
subplot(1,2,1), imshow(barbBig), title('barbBig 512 x 512 section'); 
babyBig = baby(201:712,201:712);
subplot(1,2,2), imshow(babyBig), title('babyBig 512 x 512 section');
 
%%
close all;
barbfft_1 = fftshift(abs(fft2(barbBig)).^2);
barbspectrum = log(barbfft_1 + 1);
figure,
subplot(1,2,1),
imshow(barbspectrum / max(max(barbspectrum))),
colormap("default"),
title('Power Spectrum of barbBig w/ color');

subplot(1,2,2), 
imshow(barbspectrum / max(max(barbspectrum))),
title('Power Spectrum of barbBig');
 
%%
close all;
babyfft_1 = fftshift(abs(fft2(babyBig)).^2);
babyspectrum = log(babyfft_1 + 1);
figure, subplot(1,2,1),
imshow(babyspectrum / max(max(babyspectrum))),
colormap("default"),
title('Power Spectrum of babyBig w/ color');

subplot(1,2,2),
imshow(babyspectrum / max(max(babyspectrum))),
title('Power Spectrum of babyBig');

%% _Part(a)_ 
%
% As can be seen from the above Power Spectrum the DC coefficient is
% located right at the center. Note that it would initially be in the
% corner but the fftshift brings it to the center. First fft transforms the 
% signal to frequency domain, then the shift is basically rearanges the 
% fourier transform by shifting the DC to center. Before the fftshift, 
% the DC coefficient is located in the (1,1) position, and the low 
% frequencies are out in the four corner areas. The fftshift swaps the 
% quadrants, making the corner of each into the center sucuch that the 
% quadrants are symetric at the center.  
% The way we can check this is through the matlab documentation on how the 
% fftshift function shifts the DC coefficent to be at the center of the 2D 
% space, such that the spectrum looks symetric. 
%
%% _Part(b)_
%
% By just doing the visual comparision, we can say that barbbig has a
% higher frequency content because of the vertical and horizontal lines
% that we see in the image and power spectrum. 
% Looking at the babyBig and it's power spectra, there are some high freq
% components, however not as high as barbbig. we just see the white circle 
% in the middle which is a low frequency component. 
% Barbara will have more of the aliasing problem from downsampling because 
% of the high frequency components in the image. 
% 


