clear all
syms n z Y
y2=sym('y(n+2)');
y1=sym('y(n+1)');
y0=sym('y(n)');
a=input('the coefficient of y(n+2)=');
b=input('the coefficient of y(n+1)=');
c=input('the coefficient of y(n)=');
nh=input('the nonhomogeneous part=');
eqn=a*y2+b*y1+c*y0-nh;
ZTY=ztrans(eqn,n,z);
if a==0
    d=input('the initial value y(0) is =');
    ZTY=subs(ZTY,{'ztrans(y(n),n,z)','y(0)'},{Y,d});
else
       e=input('the initial value y(0) is =');
       d=input('the initial value y(1) is =');
       ZTY=subs(ZTY,{'ztrans(y(n),n,z)','y(o)','y(1)'},{Y,d,e});
end
eq=collect(ZTY,Y)
Y=simplify(solve(eq,Y))
y=simplify(iztrans(Y,z,n))
