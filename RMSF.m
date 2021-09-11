function x_rmsf = RMSF(X)
N = length(X);
diffX = diff(X);
M = length(diffX);
temp1 = 0;
temp2 = 0;
% Tinh Tong X_cham Tu So
for i = 1:M
    temp2 = temp2 + diffX(i)^(2);
end
% Tinh tong X duoi Mau So
for j = 1:N
    temp1 = temp1 + X(j)^(2);
end
x_rmsf = sqrt(temp2 / (4*pi^(2))*temp1);
end