function x_rms = RMS(x, eps)
%RMS Summary of this function goes here
%   Detailed explanation goes here
    x_rms = sqrt(mean(x.^2, 1));
    x_rms(x_rms<eps) = eps;
    x_rms = 20*log10(x_rms); 
end

