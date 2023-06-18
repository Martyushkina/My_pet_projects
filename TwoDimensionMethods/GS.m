function [x_min, f_min, k] = GS(f, a, b, eps, k_max)
    a1 = a;
    b1 = b;
    k = 1;
    gs_const = (5^0.5 - 1)/2;
    x1 = b - gs_const * (b - a);
    x2 = a + gs_const * (b - a);

    while k <= k_max
        if f(x1) <= f(x2)
            b1 = x2;
            x2 = x1;
            x1 = a1 + b1 - x1;
        elseif f(x1) > f(x2)
            a1 = x1;
            x1 = x2;
            x2 = a1 + b1 - x2;
        end
        
        if abs(b1 - a1) <= eps
            x_min = (a1 + b1)/2;
            f_min = f(x_min);
            break
        end

        k = k + 1;
    end
end