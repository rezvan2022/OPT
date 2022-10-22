clc
clear all
close all
nData = 100;
% Inputs = rand(3,nData) * 1 - 0.5;
% Target = Inputs(1,:) .* Inputs(2,:).^2 + cos(pi*Inputs(2,:)).* Inputs(3,:);
[x2,y2]=textread('2.txt','%f %f');
[x5,y5]=textread('5.txt','%f %f');
[x10,y10]=textread('10.txt','%f %f');
[x15,y15]=textread('15.txt','%f %f');
[x20,y20]=textread('20.txt','%f %f');
[x25,y25]=textread('25.txt','%f %f');
x2=sort(x2,'ascend');
y2=sort(y2,'ascend');
y5=sort(y5,'ascend');
x5=sort(x5,'ascend');
x20=sort(x20,'ascend');
x25=sort(x25,'ascend');
y20=sort(y20,'ascend');
y25=sort(y25,'ascend');
x10=sort(x10,'ascend');
x15=sort(x15,'ascend');
y10=sort(y10,'ascend');
y15=sort(y15,'ascend');
Inputs=[x2',x10',x15',x20',x25';2*ones(1,10),10*ones(1,10),15*ones(1,10),20*ones(1,10),25*ones(1,10)];
Target=[y2',y10',y15',y20',y25'];
% Inputs=[x2',x5',x10',x15',x20',x25';2*ones(1,10),5*ones(1,10),10*ones(1,10),15*ones(1,10),20*ones(1,10),25*ones(1,10)];
% Target=[y2',y5',y10',y15',y20',y25'];
% Inputs=[x2',x10',x15',x25'];
% Target=[y2',y10',y15',y25'];
plot(Target,'ro')
hold on
%Set up the neural network
NNeron = [ 5 5 5];
% net = newcf(Inputs,Target,NNeron);
net = newff(Inputs,Target,NNeron);
%Train the neural network
net.trainParam.epochs = 500;
net.trainParam.goal = 0.;
net.trainParam.min_grad = 1e-10;
net.trainParam.max_fail=3.0	
net = train(net,Inputs,Target);
Outputs = net(Inputs);
plot(Outputs,'kv')
perf = perform(net,Outputs,Target)
% %Test the neural network
nData = 20;
Inputs = [x5';5*ones(1,10)];
Target = [y5];
Outputs = net(Inputs);
figure(2)
plot(Target,'ro','linewidth',1.)
hold on
plot(Outputs,'kv','linewidth',1.)
