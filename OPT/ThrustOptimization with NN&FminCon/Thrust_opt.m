function [T1,T2]=Thrust_opt(Y)
% ann_net=load('mynet.mat')
load('ANN_tv','mynetv');
load('ANN_tp','mynetp');
T_p=sim(mynetp,Y);
T_v=sim(mynetv,Y);
% size(TT)
T1=T_v;
T2=T_p;
