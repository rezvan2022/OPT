function [x,y,S_out]= Cont_pt_generator()
%reading control points
[x0,y0,z0]=textread('points.dat','%s %s %s');
%converting cel format into numbers
x0=cellfun(@str2num,x0)
y0=cellfun(@str2num,y0)
z0=cellfun(@str2num,z0);
%inteval for generating random number.
a=-0.999;
b=0.999;
x=x0;
%production of rand  control points for each coordinate
max_dev=0.1;% max allowed deviation
y=rand(length(x0),1);
while issorted(y)==0; % ensure the acending trend in y vector
for i=1:length(x0)
    if (i==1)
        y(i,1)=y0(i,1);
        else
        y(i,1)=y0(i,1)+0.15*((b-a).*rand(1,1)+a)*y0(i,1);
    end
end
end
%y vector has been generated
% plot(x0,y0,'s')
% hold on
% plot(x,y,'d')
% xx=0:0.01:max(x);
% yy=spline(x,y,xx);
% yy0=spline(x0,y0,xx);
% plot(xx,yy)
% hold on
% plot(xx,yy0)
% ploting x & y makes us shore that generated y is within the range
% plot(x,y,'*')
% hold on
% plot(x0,y0,'s')
S_out=3.14*y(end,1)^2;



