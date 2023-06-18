function [b] = ReverseBits(a, n)
b = 0;
for i = 1:n
   %c = bitand(a, 1);
   %b = bitshift(b, 1);
   %b = b + c;
    b = b + b + bitand(a, 1);
    a = bitshift(a, - 1);
end
end
