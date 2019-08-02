function y = backsub(R,x)
%BACKSUB
%
% y = BACKSUB(R,x) calculates y = inv(R)*x for an upper triangular matrix R
% via backsubstitution

n = size(R,1);

y = zeros(size(x));
for i = n:-1:1
    y(i,:) = (x(i,:) - R(i,i+1:end)*y(i+1:end,:))./R(i,i);
end