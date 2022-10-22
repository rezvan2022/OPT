clc
clear all
close all
global numFunc
numFunc=0;
% figure;
% x=0:.1:4.0;
% y=double(subs(ObjFun(x)));
% plot(x,y)
% hold on 
% f is define over [a,b];[0,4]
a=0;                            
b=4;                           
tol=10^-15;               % acceptable error
it_no= 100000;                       % Iteration Numbers
gs_fr=0.618;      % Golden Section Factor
k=0;                            % Initial No. of iteration allocation
x1=a+(1-gs_fr)*(b-a);             % updating interval
x2=a+gs_fr*(b-a);
ObjFun_x1=ObjFun(x1);                     
ObjFun_x2=ObjFun(x2);
% plot(x1,ObjFun_x1,'s')              %Plotting updated interval
% plot(x2,ObjFun_x2,'s')

while ((abs(b-a)>tol) && (k<it_no)) % iterative loop
    k=k+1;
    if(ObjFun_x1<ObjFun_x2)
        b=x2;
        x2=x1;
%        ObjFun_x2=ObjFun(x2);
       ObjFun_x2=ObjFun_x1;
        x1=a+(1-gs_fr)*(b-a);
        ObjFun_x1=ObjFun(x1);
%         plot(x1,ObjFun_x1,'s');
    else
        a=x1;
        x1=x2;
        x2=a+gs_fr*(b-a);
        ObjFun_x2=ObjFun_x1;
        ObjFun_x1=ObjFun(x1);
%         ObjFun_x2=ObjFun(x2);
%         plot(x2,ObjFun_x2,'s')
    end
    
    k=k+1;
end
if(ObjFun_x1<ObjFun_x2)
    disp('x_min='); disp(x1);
    disp('ObjFun(x_min)='); disp(ObjFun_x1);
%     plot(x1,ObjFun_x1,'d')
else
    disp('x_min='); disp(x2);
    disp('ObjFun(x_min)='); disp(ObjFun_x2);
%     plot(x2,ObjFun_x2,'d')
end
 disp('Number Of Iteration='); disp(k);
 disp('Number of call function='); disp(numFunc);
 disp('Achieved Error='); disp(abs(b-a));

  