clear variables;
clc;

x_0 = [5; 8];
a = -2.0;
b = 2.0;
eps = 1e-4;
k_max = 1e4;
syms x1 x2
nf = sym('nf');
nf(x1, x2) = (x1 + 1)^2 + (x2 + 1)^2 + 2;

%x = CoordDescent(@f, x_0, a, b, eps, k_max);
%disp(x);
% x = PatternSearch(@f, x_0, a, b, eps, k_max);
% disp(x);
% h = 1;
% g = 2;
% [x, k] = PSNoOpt(@f, x_0, h, g, eps, k_max);
% disp(x);
% [x, k] = Newton(nf, x1, x2, x_0, eps);
% disp(x);
% tic
% [x, k] = NewtonRafson(@f, nf, x1, x2, x_0, a, b, eps, k_max);
% disp(x);
% disp(k);
% toc
% tic
% [x, k] = BFGS(nf, x1, x2, x_0, a, b, eps, k_max);
% disp(x);
% disp(k);
% toc


function val = f(x)
    val = (x(1) + 1)^2 + (x(2) + 1)^2 + 2;
end

