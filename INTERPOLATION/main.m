X = 0:45:360;
Y = sind(X)+0.08*rand(size(X));

for i = 1:360
    x0 = i;
    y0 = Neighbour(X, Y, x0);
    X1(i) = x0;
    Y1(i) = y0;
    y0 = Linear(X, Y, x0);
    Y2(i) = y0;
    y0 = Newton(X, Y, x0);
    Y3(i) = y0;
    y0 = Lagrang(X, Y, x0);
    Y4(i) = y0;
    y0 = Spline(X, Y, x0);
    Y5(i) = y0;
    y0 = Approximate(X, Y, x0, 5);
    Y6(i) = y0;
    y0 = Approximate(X, Y, x0, 3);
    Y7(i) = y0;
    y0 = Approximate(X, Y, x0, 7);
    Y8(i) = y0;
end

figure, plot( X1, Y1, X1, Y2, X1, Y3, X1, Y4, X1, Y5, X1, Y6);
legend("Neighbour","Linear","Newton","Lagrang","Spline", "Approximate")

figure, plot( X1, Y7, X1, Y6, X1, Y8);
legend("Approximate - 3","Approximate - 5","Approximate - 7")




