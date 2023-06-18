function [T,X] = Eiler(Koshi, t, x0)

n = length(t);
m = length(x0);
X = zeros(n, m);
T = t;
X(1, :) = x0;

for i = 1:n-1
    dt = t(i + 1) - t(i);
    X(i + 1, : ) = X(i, :) + dt*(Koshi(t(i), X(i, :)))';
end

end