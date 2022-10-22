clc
clear all
close all
global numFunc
x = linspace(0,4,201);
y = ObjFun(x);
plot(x,y)
hold on
numFunc = 0;
tic
A = 0;
fA = ObjFun(A);
B = 4;
fB = ObjFun(B);
L = 1000;
    x0 = A + 2*(B-A) / 4;
    f0 = ObjFun(x0);
    k=0;
while(L>1e-16)
    x1 = A + (B-A) / 4;
    x2 = A + 3*(B-A) / 4;
    f1 = ObjFun(x1);
    f2 = ObjFun(x2);
    if((f1<f0)&&(f0<f2))
        B = x0;
        x0 = x1;
        f0 = f1;
    elseif((f1>f0)&&(f0>f2))
        A = x0;
        x0 = x2;
        f0 = f2;
    else
        A = x1;
        
        B = x2;
    end
    L = B-A;
    %     pause
    k=k+1;
end
disp(sprintf('CPU time: %6.4f',toc))
disp(k)
disp(L)