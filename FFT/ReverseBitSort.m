function [X1] = ReverseBitSort(X, n)
N = length(X);
X1 = zeros(N, 1);
for i = 0:N - 1
    b = ReverseBits(i,n);
    X1(i + 1) = X(b + 1);
end
end
