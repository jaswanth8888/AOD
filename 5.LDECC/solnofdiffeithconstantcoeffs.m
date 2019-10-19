clc
clear all
close all
eqn=input('enter hthe equation');
inits=input('enter the conditions');
y=dsolve(eqn,inits,'t');
soln=['y(t)=',char(simplify(y))];
disp(soln)
ezplot(y)
