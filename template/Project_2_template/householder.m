function [w,x1] = householder(x)
%HOUSEHOLDER calculate Householder vector w to zero-out elements of a vector x
%
% [w,x1] = HOUSEHOLDER(x) Returns a unit-norm vector w and a scalar x1 such
% that
%   (I - 2*w*w')*x = [x1, 0, ... ,0]'
%
%


% TODO




    
w = w/norm(w);