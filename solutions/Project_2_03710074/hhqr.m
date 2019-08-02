function [W,R] = hhqr(A)
%HHQR Householder QR-decomposition
%
% [W,R] = HHQR(A) calculates the QR-decomposition of a tall m x n matrix A,
% returning a m x n upper triangluar matrix R and the Householder vectors
% in the lower triangular part of W, which implicitly define the matrix Q
%

n = size(A,2);

R = A;
W = zeros(size(A));
for i = 1:n
    [w,r] = householder(R(i:end,i));
    %TODO
    R(i:end, i) = zeros(size(R(i:end,i))); R(i,i) = r;
    R(i:end, (i+1):end) = R(i:end, (i+1):end) - 2 *w *(w' * R(i:end, (i+1):end));
    W(i:end, i) = w;
end