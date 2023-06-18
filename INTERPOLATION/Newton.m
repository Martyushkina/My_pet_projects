function [y0] = Newton(X, Y, x0)
n = length(X);

    function [dy] = Diff(a, b)
        if a==b
            dy = Y(a);
        else
            dy = (Diff(a+1, b) - Diff(a, b-1))/(X(b) - X(a));
        end
    end

y0 = 0;
L = 1;
for i = 1:n
    y0 = y0 + Diff(1, i)*L;
    L = L*(x0 - X(i));
end
end
