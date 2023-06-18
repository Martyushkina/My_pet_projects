function [y0] = Spline(X, Y, x0)
n = length(X) - 1;
A = zeros(3*n - 3, 3*n - 3);
B = zeros(3*n - 3, 1);

for i = 1:n-1
    j = i + n - 1;
    k = i + 2*n - 2;
    A(i, i) = X(i)^2;
    A(i, j) = X(i);
    A(i, k) = 1;
    B(i) = Y(i);
    A(j, i) = X(i + 1)^2;
    A(j, j) = X(i + 1);
    A(j, k) = 1;
    B(j) = Y(i+1);
    if i ~= n - 1
        A(k, i) = 2*X(i + 1);
        A(k, i + 1) = -2*X(i + 1);
        A(k, j) = 1;
        A(k, j + 1) = -1;
    else
        A(k, i) = X(n + 1)^2;
        A(k, j) = X(n + 1);
        A(k, k) = 1;
        B(k) = Y(n + 1);
    end
end

U = A^(-1)*B;
k = 1;
for i = 2:n-1
    if x0 > X(i) && abs(x0 - X(i)) < abs(x0 - X(k))
        k = i;
    end
end

a = U(k);
b = U(k + n - 1);
c = U(k + 2*n - 2);

y0 = a*x0^2 + b*x0 + c;
end
