function [X] = Kramer(A, B)

%Функция Kramer решает СЛАУ методом Крамера.
%А - матрица коэффициентов системы, В - столбец свободных коэффициентов.

nx = length(B);
d_main = det(A);
X = zeros(nx, 1);

for i = 1:nx
    A_R = A;
    A_R(:, i) = B;
    X(i) = det(A_R)/d_main;
end

end