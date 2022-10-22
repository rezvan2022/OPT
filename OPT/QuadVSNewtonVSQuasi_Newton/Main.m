clc
clear all
close all
global numFunc
% 
tic
x = linspace(0,4,201);
y = ObjFun(x);
plot(x,y)
hold on
numFunc = 0;
t0 = 2.8;
A = 0;
fA = ObjFun(A);
f1 = ObjFun(t0);
% 
Success = 0;
error = 1e6;
while (Success == 0)
    if(f1>fA)
        fC = f1;
        fB = ObjFun(t0/2);
        C = t0;
        B = t0/2;
        Success = 1;
    else
        fB = f1;
        f2 = ObjFun(2*t0);
        if(f2>f1)
            fC = f2;
            B = t0;
            C = 2*t0;
            Success = 1;
        else
            f1 = f2;
            t0 = 2*t0;
        end
    end
end
% 
% 
while(error>1e-6)
    denom = (A-B) * (B-C) * (C-A);
    a = (fA*B*C*(C-B) + fB*C*A*(A-C)+fC*A*B*(B-A)) / denom;
    b = (fA*(B^2-C^2) + fB*(C^2-A^2)+fC*(A^2-B^2)) / denom;
    c = -(fA*(B-C) + fB*(C-A)+fC*(A-B)) / denom;
    LambdaStar = -b / (2*c);
    h_LambdaStar = a + b * LambdaStar + c * LambdaStar^2;
    f_LambdaStar = ObjFun(LambdaStar);
    plot(LambdaStar,f_LambdaStar,'ro')
%     
%     pause
    error = abs(1 - h_LambdaStar / f_LambdaStar)
    if((LambdaStar>B)&&(f_LambdaStar<fB))
        A = B;
        fA = fB;
        B = LambdaStar;
        fB = f_LambdaStar;
    elseif((LambdaStar>B)&&(f_LambdaStar>fB))
        C = LambdaStar;
        fC = f_LambdaStar;
    elseif((LambdaStar<B)&&(f_LambdaStar<fB))
        C = B;
        fC = fB;
        B = LambdaStar;
        fB = f_LambdaStar;
    elseif((LambdaStar<B)&&(f_LambdaStar>fB))
        A = LambdaStar;
        fA = f_LambdaStar;
    end
end
disp(sprintf('CPU time: %6.4f',toc))
% 
