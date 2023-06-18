close all;
clc;
clear variables;
t = 0:1/1024:1;
t=t(1:1024);
[X] = sin(2*50*pi*t);

[Z] = DFT(X);
figure, plot(abs(Z))

[X] = sin(2*200*pi*t);

[Z] = DFT(X);
figure, plot(abs(Z))

[X] = sin(2*50*pi*t) + sin(2*200*pi*t);

[Z] = DFT(X);
figure, plot(abs(Z))

w = 50;

[X] = sin(2*w*pi*t);
for i = 2:10
    [X] = [X] + sin(2*i*w*pi*t);
end
[Z] = DFT(X);
figure, plot(abs(Z))

[X] = sin(2*50*pi*t) + sin(2*200*pi*t);
[X] = [X] + rand(size(X));
[Z] = DFT(X);
figure, plot(abs(Z))


Z1=zeros(size(Z));
Z1(51)=Z(51);
Z1(975)=Z(975);
X1=IDFT(Z1);
X1=real(X1);

figure
subplot(2, 1, 1)
plot(t, X, "r")
title("Random noise")
subplot(2, 1, 2)
plot(t, X1)
title("Clear")

for i = 12:17
    disp(i);
    t = 0:1/2^i:1;
    t = t(1:2^i);
    [X] = sin(2*50*pi*t);
    tic
    [Z] = DFT(X);
    toc
end