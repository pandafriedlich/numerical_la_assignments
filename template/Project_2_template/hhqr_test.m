
m = 5;
n = 3;

A = randn(m,n) + 1i*randn(m,n);

[W,R] = hhqr(A);

for i = 1:n
    if abs(W(i:end,i)'*W(i:end,i) - 1) > 2*m*eps
        error('W does not contain proper reflectors')
    end
end

if norm(triu(R) - R) > 2*m*eps
    error('R is not upper triangular')
end

if norm(applyQHe(W,A) - R) > 2*m*eps
    error('Q^He * A is not equal to R')
end

disp('OK')