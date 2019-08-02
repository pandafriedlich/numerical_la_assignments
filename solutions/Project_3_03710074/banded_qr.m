function [W, R, p] = banded_qr(A)
%BANDED Householder QR-decomposition
%
% [W,R,p] = BANDED_QR(A) calculates the QR-decomposition of a tall and banded
% m x n matrix A, returning a m x n upper triangluar matrix R, the Householder vectors
% in the lower triangular part of W (which implicitly define the matrix Q)
% and the lower bandwidth p of matrix A.
%


[m, n] = size(A);
[p, ~] = bandwidth(A);

R = A;
W = zeros(size(A));

%TODO
for i = 1:n
    lb = min(i+p, size(A,1));
    [w,r] = householder(R(i:lb,i));
    %TODO
    R(i:lb, i) = zeros(size(R(i:lb,i))); R(i,i) = r;
    R(i:lb, (i+1):end) = R(i:lb, (i+1):end) - 2 *w *(w' * R(i:lb, (i+1):end));
    W(i:lb, i) = w;
end

end
