function [X] = JGauss(A, B)

%Функция JGauss решает СЛАУ методом Жордана - Гаусса.
%А - матрица коэффициентов системы, В - столбец свободных коэффициентов.

nx = length(B);
X = zeros(nx, 1);
M = zeros(nx, nx + 1);
M(1:nx, 1:nx) = A;
M(1:nx, nx + 1) = B;

for i = 1:nx
    if M(i, i) == 0
        for j = i + 1:nx
            if M(j, i) ~= 0
                M(i, 1 : nx + 1) = M(i, 1 : nx + 1) + M(i, nx + 1);
                break
            end
            if M(i, j) == 0
                return
            end
        end
    end
    M(i, 1:nx) = M(i, 1:nx)/M(i, i);
    
    for j = 1:nx
        if j ~= i
            M(j, 1 : nx + 1) = M(j, :) - M(j, i)*M(i, :);
        end
    end
    X = M(1:nx, nx + 1);

end
end