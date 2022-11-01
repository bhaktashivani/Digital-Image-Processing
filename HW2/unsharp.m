function im_out = unsharp(im_in, maskA, weight)
% INPUTS: 
% im_in : Input Image 
% maskA : small odd-sized lowpass filter mask (LPF)
% weight : positive number (k >= 1)

% OUTPUTS: 
% im_out : Output Image
    
[a,b] = size( maskA ); 
maskB = zeros( size( maskA));
maskB(ceil(a/2),ceil(b/2)) = 1; % Original Signal (matrix of zeros with center 1) 
maskC = maskB - maskA; % highFreq (HPF(orig)) = orig - LPF(orig) 
maskD = maskB + weight * maskC; % output = orig + k * HPF(orig) : : unsharp mask  
im_out = conv2(im_in,maskD,'valid');  % sharpened signal 
end 


