function x = ls_svd(A,b)

    [U,Sigma,V] = svd(A);
    n = size(A,2);
    Ured = U( :,1:n);
    Vred = V( :,1:n);
    Sred = Sigma(1:n, 1:n);
    c = Ured'*b;
    w = 1./diag(Sred) .* c;
    x = V*w;
    
end