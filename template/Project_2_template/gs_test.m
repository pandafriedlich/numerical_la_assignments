
m = 5;
n = 3;

A = randn(m,n) + 1i*randn(m,n);

[Q,R] = gs(A);

if norm(Q'*Q - eye(n)) > 2*m*eps
    error('Q is not subunitary')
end

if norm(triu(R) - R) > 2*m*eps
    error('R is not upper triangular')
end

if norm(A - Q*R) > 2*m*eps
    error('A is not equal to Q*R')
end

disp('OK')