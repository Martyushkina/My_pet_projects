function [A]=Generate(n)
    A=rand(n);
    A=A*A;
    A=A+n^2*eye(n);
end

