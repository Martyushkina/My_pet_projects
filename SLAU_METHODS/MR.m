function [X] = MR(A,B,eps0,w)
%Метод релаксаций решения СЛАУ

N = length(A);
X = zeros(N,1);
X1 = zeros(N,1);
eps = eps0 + 1;

while eps > eps0
    for i = 1:N
        s = 0;
        for j = 1:i-1
            s = s + A(i,j) * X1(j);
        end
        for j = i+1:N
            s = s + A(i,j) * X(j);
        end
        X1(i) = (B(i) - s)/A(i,i);
    end
    X1 = X + w*(X1 - X);
    eps = sum(abs(X1(i) - X(i)));
    X = X1;
end
end
