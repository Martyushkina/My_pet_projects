function [x] = PatternSearch(f, x_0, a, b, eps, k_max)
    x = x_0;
    x_i = [inf; inf];
    h = 0.0;

    while norm(x - x_i) > eps

        for d = 1:2
            e = [0.0; 0.0];
            e(d) = 1.0;
            x_i(d) = x(d);
            [h, ~, ~] = GS(@f_lmbd, a, b, eps, k_max);
            x(d) = x(d) + h;
        end

        if norm(x - x_i) > eps
            e = x - x_i;
            [h, ~, ~] = GS(@f_lmbd, a, b, eps*10^(-1), k_max);
            x_i = x;
            x = x + h*e;
        end
    end
    
    function val = f_lmbd(lmbd)
        val = f(x + lmbd*e);
    end
   
end