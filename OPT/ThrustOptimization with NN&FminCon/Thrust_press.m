function [T_p]=Thrust_press(Y)
% ann_net=load('mynet.mat')
load('ANN_tp','mynetp');
T_p=sim(mynetp,Y);
% size(TT)
