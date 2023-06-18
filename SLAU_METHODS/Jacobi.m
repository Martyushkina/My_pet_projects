function [X] = Jacobi(A,B,eps0)

%Метод Якоби решения СЛАУ

N = length(A);
X = zeros(N,1);
X1 = zeros(N,1);
eps = eps0 + 1;

while eps > eps0
    for i = 1:N
        s = 0;
        for j = 1:N
            if i~=j
                s = s + A(i,j) * X(j);
            end
        end
        X1(i) = (B(i) - s)/A(i,i);
    end
    eps = sum(abs(X1 - X));
    X = X1;
end
end
