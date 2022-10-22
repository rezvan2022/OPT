%quasi-newton
clc
clear all
close all
tic
tol=10^-4;
dl=0.00001;
x=0:.1:4.0;
y=double(subs(d_ObjFun(x)));
plot(x,y)
hold on 
err=1000;
global numFunc
numFunc=0;
ln=2.8;
while abs(err)>tol
    num=dl*(ObjFun(ln+dl)-ObjFun(ln-dl));
    dum=2*(ObjFun(ln+dl)-2*ObjFun(ln)+ObjFun(ln-dl));
ln1=ln-num./dum;
ln=ln1;
err=d_ObjFun(ln)
y=d_ObjFun(ln);
plot(ln,y,'*')
hold on
end
toc