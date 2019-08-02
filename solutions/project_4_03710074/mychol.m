function L = mychol(A)
%MYCHOL
%
% L = MYCHOL(A) given a positive definite matrix A returns a lower
% triangular L such that
% L*L^He = A

m = size(A,2);
L = A;

for i = 1:m-1
    if L(i,i) <= 0
        warning('indefinite matrix')
        L(i:end,i:end) = eye(m-i+1)*eps;
        break
    end
   
    %TODO
    for j = i+1:m
       L(j:m, j) = L(j:m, j) - L(j, i)'/L(i, i) * L(j:m, i);        
    end
end

L = tril(L);

% proper scaling of columns of L
for i=1:m
    L(i:end,i) = L(i:end,i)./sqrt(L(i,i));
end