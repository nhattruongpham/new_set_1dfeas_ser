function x_specrest = SpeCrest(x)
%SPECREST Summary of this function goes here
%   Detailed explanation goes here
    x_specrest = max(x,[],1) ./ sum(x,1);
    x_specrest(sum(x,1) == 0) = 0;
end

