function [Q,R] = mgs(A)

n = size(A,2);

Q = A;
R = zeros(n,n);

for i=1:n
    R(i,i) = norm(Q(:,i));
    Q(:,i) = Q(:, i) / R(i,i);      % normalization
    %TODO
    R(i, (i+1):end) = Q(:,i)'* Q(:, (i+1):end);
    Q(:, (i+1):end) = Q(:, (i+1):end) - Q(:,i)* R(i, (i+1):end);
    
end

end