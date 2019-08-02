m = 100;

x = linspace(0.1, 1, m)';

% This code generates an m x m Vandermonde matrix
Vfull = vander(x);
Vfull = fliplr(Vfull);

n = 12;
V = V(:,1:n);

y = sin(1./x); 

%TODO: solution with classical GS
aGS = ?

%TODO: solution with modified GS
aMGS = ?

%TODO: solution with Housholder QR
aHH = ?

%TODO: solution for Programming Task 2.12
aMSG2 = ?

figure 
hold all

plot(x,[y, polyval(aGS(end:-1:1),x), polyval(aMGS(end:-1:1),x), polyval(aHH(end:-1:1),x)])

legend('orig','gs','mgs','hh')

%TODO: Uncomment for Programming Task 2.12

%plot(x,[y, polyval(aGS(end:-1:1),x), polyval(aMGS(end:-1:1),x), ...
                %polyval(aHH(end:-1:1),x), polyval(aMGS2(end:-1:1),x)])
%legend('orig','gs','mgs','hh', 'mgs2')

