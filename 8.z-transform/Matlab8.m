clc
 clear all
 syms x a0 a1 a2 a3 a4 m c1 c2
 y=a0*x^m+a1*x^(m+1)+a2*x^(m+2)
                               +a3*x^(m+3)+a4*x^(m+4)
 eq=x^2*diff(y,x,2)+x*diff(y,x,1)+x^2*y
 eq1=collect(eq)
 eq2=coeffs(simplify(eq1*x^(1-m)),x)
eq3=solve(eq2(1),m) % roots of indicial equation 
 a1=solve(eq2(2),a1)
 a2=solve(eq2(3),a2)
 a3=subs(solve(eq2(4),a3))
 a4=subs(solve(eq2(5),a4))
 ss=a0*x^m+a1*x^(m+1)+a2*x^(m+2)
                                 +a3*x^(m+3)+a4*x^(m+4)
y1=subs(ss,m,eq3(1)) 
y2=subs(diff(ss,m),m,eq3(1))
 gs=c1*y1+c2*y2
 X = 0:0.1:20;
 Y = zeros(5,numel(X));
 J = zeros(5,numel(X));
 Y0 = bessely(0,X);
 J0=besselj(0,X);
 subplot(1,2,1),plot(X,J0)
 title('First kind')
 xlabel('X')
 ylabel('J_0(X)')
 subplot(1,2,2),plot(X,Y0)
 title('second kind')
 xlabel('X')
 ylabel('Y_0(X)')
 

