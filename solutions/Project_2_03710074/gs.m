function [Q,R] = gs(A)

n = size(A,2);
m = size(A,1);

Q = zeros(m,n);
R = zeros(n,n);

for i=1:n
    v = A(:,i);
    %TODO
    for j = 1:1:(i-1)
        R(j, i) = Q(:,j)' *  A(:,i);
%         v = v - R(j, i) * Q(:,j);
        % The following line leads to the same performance as the version
        % of Tutor Valentine
        v = v -  Q(:,j) * Q(:,j)' *  A(:,i);
    end
    R(i, i) = norm(v);
    Q(:, i) = v/R(i,i);    
end
end