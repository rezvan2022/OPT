
Inputs=xlsread('xy_data.xlsx','sheet1');
Tv=xlsread('Thrust_database.xlsx','sheet1');
Target=[Tv];
NNeron = [5 5 5];
mynetv = newcf(Inputs,Target,NNeron);
mynetv.trainParam.epochs = 500;
mynetv.trainParam.goal = 1e-16;

%% Training The mynetv
mynetv= train(mynetv,Inputs,Target);
Outputs = mynetv(Inputs);
perf = perform(mynetv,Outputs,Target);
 save('ANN_tv','mynetv')




