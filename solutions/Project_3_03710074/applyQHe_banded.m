function Y = applyQHe_banded(W, X, p)
%APPLYQHE_BANDED apply Householder transformations
%
% Y = APPLYQHE_BANDED(W,X) applies the Householder transformations corresponding
% to the vectors in W (obtained from a banded matrix) to the matrix X such that if W is result of a
% Householder QR-decomposition we have Y = Q'*X.
%

[m, n] = size(W);
Y = X;

for i = 1:n
    j = min(i+p, m);
    Y(i:j,:) = Y(i:j,:) - 2*W(i:j,i)*(W(i:j,i)'*Y(i:j,:));
end