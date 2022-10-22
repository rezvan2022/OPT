function d_obj = d_ObjFun(lambda)
% this function evaluates the objective of our problem
% lamda is the design parameter
global numFunc
d_obj = 5*(lambda .^4) - 15*( lambda.^2) - 20;
numFunc = numFunc+1
pause(0.3);