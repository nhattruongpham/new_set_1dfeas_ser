function x_zcr = ZCR(x)
%ZCR Summary of this function goes here
%   Detailed explanation goes here
    x_zcr = mean(abs(diff(sign(x))));
end

