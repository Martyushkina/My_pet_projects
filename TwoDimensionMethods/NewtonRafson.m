function [x, k] = NewtonRafson(f, nf, x1, x2, x_0, a, b, eps, k_max)
    x = x_0;
    [g1] = gradient(nf, [x1, x2]);
    grad = double(subs(g1, {x1, x2}, {x_0(1), x_0(2)}));
    H = double(subs(hessian(nf), {x1, x2}, {x_0(1), x_0(2)}));
    H = inv(H);
    k = 0;
    while norm(grad) > eps
        [alpha, ~, ~] = GS(@f_lmbd, a, b, eps, k_max);
        x = x_0 - alpha*H*grad;
        H = double(subs(hessian(nf), {x1, x2}, {x_0(1), x_0(2)})); 
        grad = double(subs(g1, {x1, x2}, {x(1), x(2)}));
        x_0 = x;
        k = k + 1;
    end
    x = double(x);
    function val = f_lmbd(lmbd)
        val = f(double(x_0 - lmbd*H*grad));
    end

    
end