function x_smrv = SMRV(X)
N = length(X);
squabs = 0;
for i = 1:N
    squabs = squabs + sqrt(abs(X(i)));
end
x_smrv = (1/N * squabs)^(2);
end