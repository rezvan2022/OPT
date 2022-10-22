
clc
clear all
close all
global numfun
numfun=0
a = 1;
X( 1,:) = [4.0 4.0]; 
X(2,:) = [4.0 4.0] + a * [1 0];
X(3,:) = [4.0 4.0] + a * [0 1];
[X_opt, No_feval]=simplex_final ( X, @ObjFunc, 1 )