m = 10;

x = randn(10,1) + 1i*randn(10,1);

[w,x1] = householder(x);

if abs(norm(w)-1) > eps
    error('w should be unit-norm')
end

xt = x - 2*w*(w'*x);

if abs(xt(1) - x1) > 2*m*eps
    error('x1 is not correct')
end


if norm(xt(2:end)) > 2*m*eps
    error('w does not zero out the tail of x')
end

normW = sqrt(2*(x'*x) + 2*abs(x(1))*norm(x));
if abs( abs(w(1))*normW - (norm(x) + abs(x(1)))) > 2*m*eps
    error('the first element of w does not have the desired absolute value')
end
    
disp('OK')