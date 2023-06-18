N = [100 200 300 400 500];
N(1, 1:3)
% for pass = 1:length(N)
% 
%     n = N(pass);
%     A = Generate(n);
%     B = rand(n, 1);
% 
%     tic
%     X = Grad(A, B, 1e-6, 0.001);
%     T1(pass) = toc;
% 
%     tic
%     X = Jacobi(A, B, 1e-6);
%     T2(pass) = toc;
% 
%     tic
%     X = JGauss(A, B);
%     T3(pass) = toc;
% 
%     tic
%     X = Kramer(A, B);
%     T4(pass) = toc;
% 
%     tic
%     L = Cut(A);
%     Y = Forward_Holec(L, B);
%     X = Back_Holec(Y, L);
%     T5(pass) = toc;
% 
%     tic
%     X = Zeidel(A, B, 1e-6);
%     T6(pass) = toc;
% 
%     tic
%     X = MR(A, B, 1e-6, 0.01);
%     T7(pass) = toc;
% end
% 
% figure,plot(N,T1,N,T2,N,T3,N,T4,N,T5,N,T6,N,T7);
% legend("Gradient","Jacobi", "Gauss","Kramer","Holetsky","Zeidel","Relax");
% grid on
% 
% figure,plot(N,T1,N,T2,N,T6,N,T7);
% legend("Gradient","Jacobi", "Zeidel","Relax");
% grid on
