function [T_v]=Thrust_velocity(Y)
% ann_net=load('mynet.mat')
load('ANN_tv','mynetv');
T_v=sim(mynetv,Y);
% size(TT)
