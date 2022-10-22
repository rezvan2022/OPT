function [c,ceq] = constraints(Y)
c1=Thrust_press(Y);
c2=Thrust_velocity(Y);
g1=c1/c2-0.6;
c =[g1];
ceq=[];