clc
clear all
syms n k1 k2 m
assume(n,'integer')
a=input('Enter the coefficient of y(n+2):');
b=input('Enter the coefficient of y(n+1):');
c=input('Enter the coefficient of y(n):');
g=input('Enter the coefficient of non-homogenous part:');
r=subs(solve(a*m^2+b*m+c,m));
if imag(r)~=0
    rho=sqrt(real(r(1))^2+imag(r(1))^2);
    theta=atan(abs(imag(r(1)))/real(r(1)));
    y1=(rho^n)*cos(n*theta);
    y2=(rho^n)*sin(n*theta);
elseif r(1)==r(2)
    y1=r(1)^n;
    y2=n*r(1)^n;
else
    y1=r(1)^n;
    y2=r(2)^n;
end
Co=det([y1,y2;subs(y1,n,n+1),subs(y2,n,n+1)]);
%Casoratian of the solutions
y_c=k1*y1+k2*y2;
disp('Complementary Solution is :');
disp(y_c);
if(g~=0)
    y11=subs(y1,n,n+1);
    y21=subs(y2,n,n+1);
    Co1=subs(Co,n,n+1);
    u1=simplify(symsum(-g*y21/C01,n))
    u2=simplify(symsum(g*y11/Co1,n))
    y_p=simplify(u1*y1+u2*y2);
    y=y_c+y_p;
else
    y=y_c;
end
check=input('If the problem has initial conditions then enter 1 else 0:');
if(check==1)
    yval1=input('Enter the initial condition at n=0:');
    yval2=input('Enter the initial condition at n=1:');
    cond1=strcat(char(subs(y,n,0)),'=',num2str(yval1));
    cond2=strcat(char(subs(y,n,1)),'=',num2str(yval2));
    [k1,k2]=solve(cond1,cond2);
    y=subs(y);
end
disp(collect(collect(y,y1),y2))
if(check~=0)
    nrange=0:10;
    Y=subs(y,n,nrange);
    stem(nrange,Y);
    set(gca,'XTick',linspace(0,10,11))
    xlabel('n');
    ylabel('y(n)');
end