X = 0:45:360;
Y = sind(X)+0.5*rand(size(X));

tic
for i = 1:360
    for pass=1:1000
    y0 = Neighbour(X, Y, x0);
    end
end
toc;

tic
for i = 1:360
    for pass=1:1000
    y0 = Linear(X, Y, x0);
    end
end
toc;

tic
for i = 1:360
    for pass=1:1000
    y0 = Newton(X, Y, x0);
    end
end
toc;

tic
for i = 1:360
    for pass=1:1000
    y0 = Lagrang(X, Y, x0);
    end
end
toc;

tic
for i = 1:360
    for pass=1:1000
    y0 = Spline(X, Y, x0);
    end
end
toc;

tic
for i = 1:360
    for pass=1:1000
    y0 = Approximate(X, Y, x0, 5);
    end
end
toc;