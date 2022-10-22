clc
clear all
close all
% init_ann=15;
% output_loop(init_ann);
% Ann_builder();
[x0,y0,z0]=textread('points.dat','%s %s %s');
%converting cel format into numbers
Y0=cellfun(@str2num,y0);
X=cellfun(@str2num,x0);
Y=Y0;
%upper and lower band
lb = [Y0(1,1)-0.1*Y0(1,1),Y0(2,1)-0.1*Y0(2,1),Y0(3,1)-0.1*Y0(3,1),Y0(4,1)-0.1*Y0(4,1)];
ub = [Y0(1,1)+0.1*Y0(1,1),Y0(2,1)+0.1*Y0(2,1),Y0(3,1)+0.1*Y0(3,1),Y0(4,1)+0.1*Y0(4,1)];
% lb = [Y0(1,1),0.137,0.29,0.377];
% ub = [Y0(1,1),.139,0.31,0.381];
% lb = [Y0(1,1),0.17,0.362,0.423];
% ub = [Y0(1,1),.18,0.366,0.445];
%main
T2_opt=3;
T1_opt=3;
T1_flnt=1;
T2_flnt=1;
DT1=(T1_opt-T1_flnt)/T1_flnt;
DT2=(T2_opt-T2_flnt)/T2_flnt;
% while (DT1>1e-4)|(DT2>1e-4)|(abs(T2_opt/T1_opt)<7)
N=0;
while N<10
%A=[1 -1 0 0 0;0 1 -1 0 0;0 0 1 -1 0;0 0 0 1 -1];
A=[1 -1 0 0 ;0 1 -1 0 ;0 0 1 -1];

% A=[1 -1 0 0 0;0 1 -1 0 0;0 0 1 -1 0;0 0 0 1 -1;-1 +2 -1 0 0;0 0 1 -2 1];
b=[0; 0; 0];
  Aeq=[1 0 0 0 ];
%  Aeq=[1 0 0 0 0;3 -4 1 0 0;0 0 -3 4 -1];
    beq=[.1318];
options = optimoptions('fmincon','MaxFunctionEvaluations',10000);
[Y] = fmincon('Thrust_opt',Y0,A,b,Aeq,beq,lb,ub)
[T1_opt,T2_opt]=Thrust_opt(Y);

S_out=point_gen_final(X,Y);
% figure(2)
% plot(X,Y)
gambit_run();
% hold on
fluent_run();
[T1_flnt,T2_flnt]=Thrust_clc(S_out);
figure(2)
plot(N,T1_flnt(end),'ro')
hold on
plot(N,T2_flnt(end),'d')
data_recorder(T1_flnt,T2_flnt,Y);
Ann_builder_tp;
Ann_builder_tv;
Thrust_ratio=T1_flnt/T2_flnt
N=N+1;
end



