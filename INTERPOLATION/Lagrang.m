function [y0] = Lagrang(X, Y, x0)
n = length(X);
y0 = 0;

for i = 1:n
    L = 1;
    for j = 1:n
        if i~=j
            L = L*((x0 - X(j))/(X(i) - X(j)));
        end
    end
y0 = y0 + Y(i)*L;
end

end
