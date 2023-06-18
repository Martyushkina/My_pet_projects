function [x, k] = Newton(f, x1, x2, x_0, eps)
    x = x_0;
    [g1] = gradient(f, [x1, x2]);   
    grad = double(subs(g1, {x1,x2}, {x_0(1), x_0(2)}));

    k = 0;
    H = double(subs(hessian(f), {x1, x2}, {x_0(1), x_0(2)}));
    H = inv(H);
    while norm(grad) > eps
        x = x_0 - H*grad;
        grad = double(subs(g1, {x1,x2}, {x, x}));
        x_0 = x;
        k = k + 1;
    end
    
end