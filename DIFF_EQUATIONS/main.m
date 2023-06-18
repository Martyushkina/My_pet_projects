clear
close all
t = 0:0.01:10;
X = [0, 0];
[T, X_R] = ode45(@Koshi,t,X); %MatLab solution

[T, X_E] = Eiler(@Koshi,t,X); %Эйлер
[T, X_EK] = EilerKoshi(@Koshi,t,X); %Эйлер - Коши
[T, X_MD] = MeanDot(@Koshi,t,X); %Средняя точка
[T, X_AD] = Adams(@Koshi,t,X); %Адамс - Башфорт (5)
[T, X_RK] = RungeKutt(@Koshi,t,X); %Рунге - Кутт (4) 


plot(T, X_R(:,1), T, X_E(:,1), ...
    T, X_EK(:,1), T, X_MD(:,1),...
    T, X_RK(:,1), T,X_AD(:,1)); 
legend("ODE45","EILER","EILER-KOSHI",...
    "MEAN DOT", "RUNGE-KUTT","ADAMS");