m = 5;
n = 3;

A = randn(m,n) + 1i*randn(m,n);
b = randn(m,1);

x = ls_svd(A,b);

x_LS =inv(A'*A)*A'*b;

if norm(x-x_LS) > 1e-14
    error('Least squares with SVD failed')
end

disp('OK')