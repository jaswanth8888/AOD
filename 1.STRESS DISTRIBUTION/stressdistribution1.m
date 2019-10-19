clc;
clear all;
clf;
%input parameters
c=0.5;L=5;P=1;
%setting up grid of x and y values
x=[0:0.1:L];
y=[-c:0.01:c];
[X,Y]=meshgrid(x,y);
%calculations of individual stress
sx=-(3/(4*c^3))*(L-X).*Y;
sy=zeros(length(y),length(x));
txy=-(3*P/(8*c^3))*(c^2-Y.^2);
%create stress matrix
for i=1:length(y)
    for j=1:length(x)
        s=[sx(i,j),txy(i,j);txy(i,j),sy(i,j)];
        p=eig(s);%finding eigen values/principal stresses
        s1(i,j)=p(2);
        s2(i,j)=p(1);
    end
end
%plotting distribution of principle stress s1&s2
figure(1)
contour(X,Y,s1,[0.01,0.05,0.1,0.5,1,3,5,7,9,11])
axis tight
title('first principal stress contours,s1:')
figure(2)
contour(X,Y,s2,[-0.01,-0.05,-0.1,-0.5,-1,-3,-7,-9,-11])
axis tight
title('second principal stress contours,s2:')