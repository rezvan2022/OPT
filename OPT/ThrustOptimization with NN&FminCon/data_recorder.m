function data_recorder(T1_flnt,T2_flnt,Y)
Inputs=xlsread('xy_data.xlsx','sheet1');
T1=xlsread('Thrust_database.xlsx','sheet1');
T2=xlsread('Thrust_database.xlsx','sheet2');
[m,n]=size(T1);
TT1=zeros(1,n+1);
for i=1:n
    TT1(1,i)=T1(1,i);
end
TT1(1,n+1)=T1_flnt;
xlswrite('Thrust_database.xlsx',TT1,'sheet1');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(T2);
TT2=zeros(1,n+1);
for i=1:n
    TT2(1,i)=T2(1,i);
end
TT2(1,n+1)=T2_flnt;
xlswrite('Thrust_database.xlsx',TT2,'sheet2');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(Inputs)
Inp=zeros(m,n+1);
for i=1:m
    for j=1:n
    Inp(i,j)=Inputs(i,j);
    end
end
Inp(:,n+1)=Y(:,1);
xlswrite('xy_data.xlsx',Inp,'sheet1');


