function [T,X] = Adams(Koshi, t, x0)

n = length(t);
m = length(x0);
X = zeros(n, m);
T = t;
X(1, :) = x0;

[T(1:5), X(1:5,:)] = RungeKutt(Koshi, t(1:5), x0);

for i = 5:n-1
    dt = t(i + 1) - t(i);
    X(i + 1, : ) = X(i, :) ...
    + (1901/720)*dt*(Koshi(t(i), X(i, :)))' ...
    - (1387/360)*dt*(Koshi(t(i - 1), X(i - 1, :)))' ...
    + (109/30)*dt*(Koshi(t(i - 2), X(i - 2, :)))'...
    - (637/360)*dt*(Koshi(t(i - 3), X(i - 3, :)))'...
    + (251/720)*dt*(Koshi(t(i - 4), X(i - 4, :)))';
end

end