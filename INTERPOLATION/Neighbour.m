function [y0] = Neighbour(X, Y, x0)
n = length(X);
k = 1;

for i = 2:n
    if abs(x0 - X(i)) < abs(x0 - X(k))
        k = i;
    end
end

y0 = Y(k);

end
