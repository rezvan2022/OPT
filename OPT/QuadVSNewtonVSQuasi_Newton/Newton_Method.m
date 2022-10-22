%newton Methiod
clc
clear all
close all
tic
syms landa
global numFunc
numFunc=0;
ln=2.8;
tol=10^-7;
x=0:.1:4.0;
y=double(subs(d_ObjFun(x)));
plot(x,y)
hold on 
err=1000;
while abs(err)>tol
ln1=ln-(d_ObjFun(ln)/d2_ObjFun(ln));
err=abs(d_ObjFun(ln1))
ln=ln1
y=d_ObjFun(ln)
plot(ln,y,'*')
hold on
end
toc