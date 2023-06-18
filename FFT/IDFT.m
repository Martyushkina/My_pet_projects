function [Z] = IDFT(X)

N = length(X);
n = round(log(N)/log(2));
cpu = round(N/2);
W = exp(2*pi*1i/N);
Z = ReverseBitSort(X, n);

for i = 1:n
    for p = 0: (cpu - 1)
        [a1, a2] = adress(p, i);
        q = Power(p, i, n, N);
        A = Z(a1 + 1);
        B = Z(a2 + 1)*W^q;
        Z(a1 + 1) = A + B;
        Z(a2 + 1) = A - B;
    end
end
end
