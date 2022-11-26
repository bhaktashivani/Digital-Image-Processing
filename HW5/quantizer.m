%% ECE 253 Homework 5 
% _*Shivani Bhakta*_
% A13832428

%% Problem 3 Comparing quantization for images
%% _Part(a)_


function [output_img] = quantizer[input_img, s]

% Write a function that takes as inputs an 8-bit image and a scalar 
% s ∈ [1,7] and performs uniform quantization so that the output is 
% quantized to a s-bit image.

output_img = idivide(image, pow2(8-s)).pow2(8-s);
output_img = output_img + pow2(8-s-1)






end 