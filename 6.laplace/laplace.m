clear all
clc
syms t
f=input('enter the function in terms of t:');
F=laplace(f)
F=simplify(F)