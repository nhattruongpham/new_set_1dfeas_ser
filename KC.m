function x_kc = KC(X, x_rmsv, x_mv)
% x_rmsv = RMSV(X);
% x_mv = MV(X);
N = length(X);
temp = 0;
for i = 1:N
    temp = temp + (X(i) - x_mv)^(4);
end
x_kc = 1/(x_rmsv)^(4) * temp;
end