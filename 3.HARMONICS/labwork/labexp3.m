% harmonics if x in degrees 
clear all
clc
syms t
n=6;%number of terms
x_0=0;%intial x value
s=pi/3;%differnce between x values
y=[4 8 15 7 6 2];%y values correspoding to each x
n1=3; % number of harmonics
x=x_0+(0:5)*s%calculating all x values
l=(0.5)*(x(n)+s-x(1))%calculating l value
a0=(2/n)*sum(y);%calculating a0 value
F_s=(a0)/2;
for i=1:n1
    yc=y.*(cos((i*pi*x)/l));
    ys=y.*(sin((i*pi*x)/l));
    a(i)=(2/i)*sum(yc);
    b(i)=(2/i)*sum(ys);
    F_s = F_s+a(i).*(cos(i*pi*t/l))+b(i).*(sin(i*pi*t/l));
end
disp(F_s)