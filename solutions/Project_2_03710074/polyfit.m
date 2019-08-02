m = 100;

x = linspace(0.1, 1, m)';

% This code generates an m x m Vandermonde matrix
Vfull = vander(x);
Vfull = fliplr(Vfull);

n = 12;
V = Vfull(:,1:n);

y = sin(1./x); 

% %TODO: solution with classical GS
[Qred_cgs, Rred_cgs] = gs(V);
aGS = backsub(Rred_cgs, Qred_cgs'*y);
% 
% %TODO: solution with modified GS
[Qred_mgs, Rred_mgs] = mgs(V);
aMGS = backsub(Rred_mgs, Qred_mgs'*y);
% 
% %TODO: solution with Housholder QR
[W, R_hh] = hhqr(V);
R_hh = real(R_hh);
W = real(W);
Rred_hh = R_hh(1:n, :);
QHy = applyQHe(W, y);
aHH = backsub(Rred_hh, QHy(1:n ,1));

% %TODO: solution for Programming Task 2.12
[~, R] = mgs([V, y]);
Rred_mgs2 = R(1:n, 1:n);
aMGS2 = backsub(Rred_mgs2, R(1:n, end));

figure ;
hold all

plot(x,[y, polyval(aGS(end:-1:1),x), polyval(aMGS(end:-1:1),x), polyval(aHH(end:-1:1),x)])

legend('orig','gs','mgs','hh');
title(sprintf("n=%d", n));

% % TODO: Uncomment for Programming Task 2.12
figure;
plot(x,[y, polyval(aGS(end:-1:1),x), polyval(aMGS(end:-1:1),x), ...
                polyval(aHH(end:-1:1),x), polyval(aMGS2(end:-1:1),x)])
legend('orig','gs','mgs','hh', 'mgs2')

title(sprintf("n=%d", n));

n = 7;
V = Vfull(:,1:n);
% %TODO: GS
[Qred_cgs, Rred_cgs] = gs(V);
aGS = backsub(Rred_cgs, Qred_cgs'*y);
% 
% %TODO: MGS
[Qred_mgs, Rred_mgs] = mgs(V);
aMGS = backsub(Rred_mgs, Qred_mgs'*y);
% 
% %TODO: HHQR
[W, R_hh] = hhqr(V);
R_hh = real(R_hh);
W = real(W);
Rred_hh = R_hh(1:n, :);
QHy = applyQHe(W, y);
aHH = backsub(Rred_hh, QHy(1:n ,1));

% %TODO: MGS2
[~, R] = mgs([V, y]);
Rred_mgs2 = R(1:n, 1:n);
aMGS2 = backsub(Rred_mgs2, R(1:n, end));

figure;
plot(x,[y, polyval(aGS(end:-1:1),x), polyval(aMGS(end:-1:1),x), ...
                polyval(aHH(end:-1:1),x), polyval(aMGS2(end:-1:1),x)])
legend('orig','gs','mgs','hh', 'mgs2')

title(sprintf("n=%d", n));

n = 24;
V = Vfull(:,1:n);
% %TODO: GS
[Qred_cgs, Rred_cgs] = gs(V);
aGS = backsub(Rred_cgs, Qred_cgs'*y);
% 
% %TODO: MGS
[Qred_mgs, Rred_mgs] = mgs(V);
aMGS = backsub(Rred_mgs, Qred_mgs'*y);
% 
% %TODO: HHQR
[W, R_hh] = hhqr(V);
R_hh = real(R_hh);
W = real(W);
Rred_hh = R_hh(1:n, :);
QHy = applyQHe(W, y);
aHH = backsub(Rred_hh, QHy(1:n ,1));

% %TODO: MGS2
[~, R] = mgs([V, y]);
Rred_mgs2 = R(1:n, 1:n);
aMGS2 = backsub(Rred_mgs2, R(1:n, end));

figure;
plot(x,[y, polyval(aGS(end:-1:1),x), polyval(aMGS(end:-1:1),x), ...
                polyval(aHH(end:-1:1),x), polyval(aMGS2(end:-1:1),x)])
legend('orig','gs','mgs','hh', 'mgs2')

title(sprintf("n=%d", n));