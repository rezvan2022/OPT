function [S_out]=point_gen_final(x,y)
if exist('xy_data.dat')==1
    delete('xy_data.dat')
end
pause(5)
zf=zeros(16,1);
xf=[linspace(x(1,1),x(end,1),16)];
yf=spline(x',[0 y' 0],xf);
figure(1)
% %yf=interp1q(x,y,xf);
plot(xf,yf,'-*')
hold on
plot(x,y,'s')
hold on
% B=[xf;yf];
S_out=3.14*y(end);
fid=fopen('xy_data.dat','w');
fprintf(fid,'%f %f %f\r\n',[xf',yf',zf]');
fclose(fid)

