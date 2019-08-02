
m = 20;

A = randn(m,m) + 1i*randn(m,m);
L = tril(A);


x = randn(m,1) + 1i*randn(m,1);

L2 = cholRankOne(L,x);


if norm(tril(L2) - L2) > 2*m*eps
    error('L2 is not lower triangular')
end

if norm(L2*L2' - L*L' - x*x') > m*m*eps
    error('L2*L2^He is not equal to L*L^He + x*x^He')
end

disp('OK')
