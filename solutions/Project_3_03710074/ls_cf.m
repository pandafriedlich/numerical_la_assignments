function x = ls_cf(A,b)

B = A'*A;
[L,D] = choleskyFact(B);         %B is the Gram matrix
c = A'*b;
v = forwardsub(L, c);
w = (1./diag(D)) .* v;
x = backsub(L', w);


end

function y = forwardsub(L, x)
n = size(L,1);

y = zeros(size(x));
for i = 1:1:n
    y(i,:) = (x(i,:) - L(i,1:i-1)*y(1:i-1,:))./L(i,i);
end
end