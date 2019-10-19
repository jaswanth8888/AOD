clc;
clear all;
A=[0 1 1/2;1/2 0 1/2;1/2 0 0];%matrix from equations
[V,D]=eig(A);       %eigen values of the above matrix
u=V(:,1);           %the eigenvector corresponding to the eigenvalue 1 will be extracted by
x = u/sum(u)        % here x is the PageRank vector.

