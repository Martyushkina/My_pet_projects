function [X] = Grad(A,B,eps0,h)
%Метод градиентного спуска решения СЛАУ

N = length(A);
X = zeros(N,1);
X1 = zeros(N,1);
e = X;
dE = X;
eps = eps0 + 1;

while eps > eps0
    for i = 1:N
        s = 0;
        for j = 1:N
            s = s + A(i,j) * X(j);
        end
        e(i) = s - B(i);
    end
        for j = 1:N
            s = 0;
            for i = 1:N
                s = s + A(i,j) * e(i);
            end
            dE(j) = s;
        end
   
    X1 = X - h*dE;
    eps = sum(abs(e));
    X = X1;
end
end