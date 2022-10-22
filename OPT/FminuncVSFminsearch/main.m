clc
clear all
close all
options = optimset('Display','iter','PlotFcns',@optimplotfunccount,'PlotFcns',@optimplotfval,'TolFun',10^-5,'TolX',10^-5);
% fun=@ObjFunc4;
% x0 = [-1,0,0];
x0=[-1,5];
fun=@ObjFunc8;
% fun=@ObjFunc8;
[x,fval,exitflag,output] = fminunc(fun,x0,options)
%fun = @(x)100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
x1 = linspace(-100,100);
x2 = linspace(-100,100);
% x3=0*x1;
% X=[x1;x2];
for i=1:length(x1)
    for j=1:length(x2)
% y(i,j)=feval(@ObjFunc4,[x1(1,i),x2(1,j)]);
 %y(i,j)=feval(@ObjFunc6,[x1(1,i),x2(1,j)]);
y(i,j)=feval(@ObjFunc8,[x1(1,i),x2(1,j)]);

    end
end
figure
% contour3(x1,x2,y,30)
 surf(x1,x2,y)
% figure
% contour(x1,x2,y)
% x = fminsearch(fun,x0,options)
% x0 = [-1.2,1,0];
% x = fminsearch(fun,options)

