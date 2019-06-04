function [Q,R] = gs(A)

n = size(A,2);
m = size(A,1);

Q = zeros(m,n);
R = zeros(n,n);

for i=1:n
    v = A(:,i);
    %TODO
end

end