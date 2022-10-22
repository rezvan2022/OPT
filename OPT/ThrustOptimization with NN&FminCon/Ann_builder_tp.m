Inputs=xlsread('xy_data.xlsx','sheet1');
Tp=xlsread('Thrust_database.xlsx','sheet2');
Target=[Tp];
NNeron = [5 5 5];
mynetp = newcf(Inputs,Target,NNeron);
mynetp.trainParam.epochs = 500;
mynetp.trainParam.goal = 1e-16;

%% Training The mynetp
mynetp= train(mynetp,Inputs,Target);
Outputs = mynetp(Inputs);
perf = perform(mynetp,Outputs,Target);
 save('ANN_Tp','mynetp')




