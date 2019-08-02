function Lr = cholRankOne(L,x)
%CHOLRANKONE
%
% Lr = CHOLRANKONE(L,x) given a lower-triangular L and a vector x returns a
% quadratic lower-triangular Lr such that
% Lr*Lr^He = L*L^He + x*x^He

m = size(L,2);

Lr = [x L];

for i=1:m
    %TODO
    [c, s, r] = givens(Lr(i,i), Lr(i, i+1));
    Qi = [c, -s'; s, c];
    Lr(i,i+1) = 0;
    Lr(i, i) = r;
    Lr(i+1:end, i:i+1) = Lr(i+1:end, i:i+1) * Qi;
    
end

Lr = tril(Lr(:,1:m));