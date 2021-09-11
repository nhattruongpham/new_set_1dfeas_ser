function x_rmsv = RMSV(X)
% x_rmsv = rms(X);
N = length(X);
squareX = 0;
for i = 1:N
    squareX = squareX + X(i)^(2);
end
x_rmsv = sqrt(1/N * squareX);
end