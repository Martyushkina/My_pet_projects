function [Y] = Forward_Holec(L,B)

n=length(L);
Y=zeros(n,1);

for i=1:n
   s=0;
   for j=1:i-1
       s=s+L(i,j)*Y(j);
   end
   Y(i)=(B(i)-s)/L(i,i);
end
end