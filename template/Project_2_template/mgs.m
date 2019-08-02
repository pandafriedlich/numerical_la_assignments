function [Q,R] = mgs(A)

n = size(A,2);

Q = A;
R = zeros(n,n);

for i=1:n
    R(i,i) = norm(Q(:,i));
    %TODO
end

end