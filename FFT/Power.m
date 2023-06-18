function [q] = Power(p, k, n, N)

dq = bitshift(1, n-k);
q = dq * p;
q = mod(q, bitshift(N, -1));

end
