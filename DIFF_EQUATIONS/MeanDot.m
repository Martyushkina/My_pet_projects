function [T,X] = MeanDot(Koshi, t, x0)

n = length(t);
m = length(x0);
X = zeros(n, m);
T = t;
X(1, :) = x0;

for i = 1:n-1
    dt = t(i + 1) - t(i);
    k1 = dt*(Koshi(t(i), X(i, :)))';
    k2 = dt*(Koshi(t(i) + dt/2, X(i, :) + k1/2))';
    X(i + 1, : ) = X(i, :) + k2;
end

end