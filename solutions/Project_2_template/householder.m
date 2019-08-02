function [w,x1] = householder(x)
%HOUSEHOLDER calculate Householder vector w to zero-out elements of a vector x
%
% [w,x1] = HOUSEHOLDER(x) Returns a unit-norm vector w and a scalar x1 such
% that
%   (I - 2*w*w')*x = [x1, 0, ... ,0]'
%
%


% TODO
    x1 = -norm(x)*exp(1j*angle(x(1)));
    x_reflected = [x1; zeros(length(x)-1, 1)];
    w = x_reflected - x;
    w = w/norm(w);