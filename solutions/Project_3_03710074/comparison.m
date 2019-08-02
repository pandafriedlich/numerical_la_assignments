A =([1e-5, 1e-15; 1e-5 -1e-15; 1 0.5]);
b=([1; 2;0]);


x_cf = ls_cf(A,b);


x_qr = ls_qr(A,b);


x_svd = ls_svd(A,b);


x_LS = [1.5*1e5+1e-5;-3*1e5-2e-5-4e-15];

err_cf = norm(x_cf-x_LS)
err_qr = norm(x_qr-x_LS)
err_svd = norm(x_svd-x_LS)

