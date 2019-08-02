function x = ls_qr(A,b)
    [W, R] = hhqr(A);
    n = size(A, 2);
    Rred = R(1:n,:);
    c = applyQHe(W, b);
    c = c(1:n);
    x = backsub(Rred, c);
end