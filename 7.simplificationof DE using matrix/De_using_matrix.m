clc
clear all
close all
syms x1(t) x2(t)
A=input('Enter the co efiicient matrix');
lambda=eig(A)
for i=1:length(lambda)
    temp=null(A-lambda(i)*eye(size(A)));
    P(:,i)=temp./min(temp);
end
disp('the modal matraix is');
disp(P);
D =inv(P)*A*P;
X = [x1;x2];
Sol1 = dsolve(diff(x1,2) + D(1)*x1 == 0);
Sol2 = dsolve(diff(x2,2) + D(4)*x2 == 0);
disp('The solution of the system diff(X,2)+DX=0 is: ');
disp(Sol1);
disp(Sol2);
disp('The Solution of the given system is: ');
Y = P*[Sol1; Sol2]