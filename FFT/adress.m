function [a1, a2] = adress(p, k)
b = bitshift(1, k - 1);
m = b - 1;
R = bitand(p, m);
L = p - R;
%a1 = bitshift(L, 1) + R;
%a2 = bitshift(L, 1) + b + R;
a1 = L + L + R;
a2 = a1 + b;
end
