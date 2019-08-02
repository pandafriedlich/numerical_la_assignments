function [ l, d ] = choleskyFact(a)

l = a;
sizel = size(l);
m = sizel(1);

for k = 1:m-1
  for j = k+1:m
	  l(j:m, j) = l(j:m, j)-l(j, k)'/l(k, k)*l(j:m, k);
	end
end

d = diag(diag(l));
l = tril(l*inv(d));

