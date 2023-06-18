function [x] = CoordDescent(f, x_0, a, b, eps, k_max)
    x = [0.7; 0.7];
    h = 0.0;

    while norm(x - x_0) > eps
        for d = 1:2
            e = [0.0; 0.0];
            e(d) = 1.0;
            x_0(d) = x(d);
            [h, ~, ~] = GS(@f_lmbd, a, b, eps, k_max);
            x(d) = x_0(d) + h;
        end
    end

    function val = f_lmbd(lmbd)
        val = f(x_0 + lmbd*e);
    end
end