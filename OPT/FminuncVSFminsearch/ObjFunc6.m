function y = ObjFunc6(X)
x1 = X(1);
x2 = X(2);
% x1=x1/10^-6;
% x2=x2/10^-6;
y = (-13 + x1 + ((5-x2)*x2-2)*x2)^2 + (-29+x1+((x2+1)*x2-14)*x2)^2;
