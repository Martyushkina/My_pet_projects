function [y0] = Linear(X, Y, x0)
n = length(X);
k = 1;

for i = 2:n-1
    if x0 > X(i) && abs(x0 - X(i)) < abs(x0 - X(k))
        k = i;
    end
end

y0 = (Y(k + 1) - Y(k))*(x0 - X(k))/(X(k + 1) - X(k)) + Y(k);

end
