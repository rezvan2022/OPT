function [T1,T2,y]=output_loop(N)
for i=1:N
    [yt(:,1,i),S_out]=gambit_run();
    fluent_run();
    [T1(i),T2(i)]=Thrust_clc(S_out);
    pause(5)
    
    % xlswrite('Thrust_database.xlsx',y,'sheet2',)
end
   for i=1:N
        for j=1:4
            y(j,i)=yt(j,1,i);
        end
   end
   for i=1:N
    T1(1,i)=T1(i);
    T2(1,i)=T2(i);
   end
xlswrite('xy_data.xlsx',y,'sheet1')
xlswrite('Thrust_database.xlsx',T1,'sheet1')
xlswrite('Thrust_database.xlsx',T2,'sheet2')
end