function [X] = Back_Holec(Y,L)

n=length(Y);
X=zeros(n,1);
X1=zeros(n,1);

for i=0:n-1
   s=0;
   for j=0:i-1
       s=s+L(n-j,n-i)*X(n-j);
   end
   X(n-i)=(Y(n-i)-s)/L(n-i,n-i);
end
end