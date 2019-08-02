
m = 100;

A = randn(m,m);
A = A'*A;

L = mychol(A);

if norm(tril(L) - L) > 2*m*eps
    error('L is not lower triangular')
end

if norm(L*L' - A) > m*m*eps
    error('L*L^He is not equal to A')
end

disp('OK')