function y = ObjFunc4(X)
x1 = X(1);
x2 = X(2);
x3 = X(3);
% x3 =0;

if(x1>0)
    t = 1/(2*pi) * atan(x2/x1);
elseif(x1<0)
    t = 1/(2*pi) * (pi + atan(x2/x1));
end
y = 100* ( (x3 - 10*t)^2 + (sqrt(x1^2+x2^2)-1)^2 ) + x3^2;

