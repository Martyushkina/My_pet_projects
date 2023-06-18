function [T,X] = RungeKutt(Koshi, t, x0)

n = length(t);
m = length(x0);
X = zeros(n, m);
T = t;
X(1, :) = x0;

for i = 1:n-1
    dt = t(i + 1) - t(i);
    k1 = dt*(Koshi(t(i), X(i, :)))';
    k2 = dt*(Koshi(t(i) + dt/2, X(i, :) + k1/2))';
    k3 = dt*(Koshi(t(i) + dt/2, X(i, :) + k2/2))';
    k4 = dt*(Koshi(t(i) + dt, X(i, :) + k3))';
    X(i + 1, : ) = X(i, :) + (k1 + 2*k2 + 2*k3 + k4)/6;
end

end