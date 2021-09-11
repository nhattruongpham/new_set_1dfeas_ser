function x_mv = MV(X)
% x_mv = mean(X);
sumX = 0;
N = length(X);
for i=1:N
    sumX = sumX + X(i);
end
x_mv = 1/N * sumX;
end