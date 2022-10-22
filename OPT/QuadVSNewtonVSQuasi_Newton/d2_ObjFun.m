function d2_obj = d2_ObjFun(lambda)
% this function evaluates the objective of our problem
% lamda is the design parameter
global numFunc
d2_obj=20*(lambda .^3) - 30* lambda ;
% d2_obj = 
numFunc = numFunc+1
pause(0.3);