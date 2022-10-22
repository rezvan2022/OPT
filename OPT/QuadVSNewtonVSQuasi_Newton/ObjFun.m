function obj = ObjFun(lambda)
% this function evaluates the objective of our problem
% lamda is the design parameter
global numFunc
obj = lambda .^5 - 5* lambda.^3 - 20 * lambda + 5;
numFunc = numFunc+1
pause(0.3);