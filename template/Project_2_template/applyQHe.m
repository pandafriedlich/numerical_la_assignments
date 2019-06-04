function Y = applyQHe(W,X)
%APPLYQHE apply Householder transformations
%
% Y = APPLYQHE(W,X) applies the Householder transformations corresponding
% to the vectors in W to the matrix X such that if W is result of a
% Householder QR-decomposition we have Y = Q'*X.
%

n = size(W,2);
Y = X;
for i = 1:n
    Y(i:end,:) = Y(i:end,:) - 2*W(i:end,i)*(W(i:end,i)'*Y(i:end,:));
end