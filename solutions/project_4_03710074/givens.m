function [c,s,r] = givens(a,b)
%GIVENS
%
% [c,s,r] = GIVENS(a,b) returns the coefficients of for the Givens rotation
% such that
% | c         s | | a | = | r |
% | -conj(s)  c | | b |   | 0 |
%
% or
%
%       | c  -conj(s) |
% |a b| | s         c | = | r 0 |

if b == 0
    c=1; s=0;
    r = a;
    return
end

if a == 0
    c = 0;
    bsq = b*conj(b);
    r = bsq;
    s = conj(b)/bsq;
    return
end

asq = a*conj(a);
bsq = b*conj(b);

absq = asq + bsq;
d = 1/sqrt(asq*absq);

c = asq*d;

r = a*(absq*d);
s = conj(b)*(a*d);

end