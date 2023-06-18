function [x, k] = PSNoOpt(f, x_0, h, g, eps, k_max)
    x = x_0;
    k = 0;
    x1 = [0, 0, 0, 0];
    fvec = [0, 0, 0, 0];

    while abs(h) > eps && k <= k_max
        x1(1) = x(1) + h;
        x1(2) = x(2) + h;
        x1(3) = x(1) - h;
        x1(4) = x(2) - h;
        fvec(1) = f([x1(1), x(2)]);
        fvec(3) = f([x1(3), x(2)]);
        fvec(2) = f([x(1), x1(2)]);
        fvec(4) = f([x(1), x1(4)]);
        [fmin, ind] = min(fvec);

        if ind > 2
                ind = ind - 2;
        end

        if f(x) >= fmin  
            x(ind) = x1(find(fvec == fmin, 1));
        else 
            h = h/g;   
        end

        k = k + 1;
    end 
end