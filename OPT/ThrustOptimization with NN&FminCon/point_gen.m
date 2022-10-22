function [y,S_out]=point_gen()
if exist('xy_data.dat')==1
    delete('xy_data.dat')
end
pause(5)
[x,y,S_out]= Cont_pt_generator();
% spline_fit=fit(x,y,'poly2')
%xf=[x(1,1);linspace(x(2,1),x(6,1),14)';x(7,1)];
% yf=feval(spline_fit,xf)
zf=zeros(16,1);
%plot(x,yf,'*')
figure(1)
plot(x,y,'s')
hold on
xf=[linspace(x(1,1),x(end,1),16)];
yf=spline(x',[0 y' 0],xf);
% %yf=interp1q(x,y,xf);
plot(xf,yf,'-*')
hold on
% B=[xf;yf];
S_out=3.14*y(end);
fid=fopen('xy_data.dat','w');
fprintf(fid,'%f %f %f\r\n',[xf',yf',zf]');
fclose(fid)
