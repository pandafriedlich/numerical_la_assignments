
m = 5;

L = randn(m,m) + 1i* randn(m,m);
L = tril(L);

x = randn(m,2) + 1i*randn(m,2);

y = fwdsub(L,x);

x2 = L*y;

if norm(x-x2) > 5*numel(x)*eps
    error('Backsubstitution failed')
end

disp('OK')