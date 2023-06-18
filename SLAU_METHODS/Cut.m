function [L] = Cut(A)

%Функция Cut разделяет симметричную и положительно определёную матрицу А на 
% две треугольных матрицы.
%А - матрица коэффициентов системы.

n=length(A);
L=zeros(n,n);

for i=1:n
    % Поддиагональные
    for j=1:i-1
       s=0;
       for k=1:j-1
           s=s+L(i,k)*L(j,k);
       end
       L(i,j)=(A(i,j)-s)/L(j,j);
    end
    % Диагональные
    s=0;
    for j=1:i-1
        s=s+L(i,j)^2;
    end
    L(i,i)=sqrt(A(i,i)-s);
end

end
