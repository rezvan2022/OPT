function [T1,T2]=Thrust_clc(S_out)
mdot=30;
P_amb=0;
out1 = fopen('vin.txt','r');
out2 = fopen('vout.txt','r');
out3 = fopen('pout.txt','r');
out4 = fopen('pin.txt','r');
for i=1:6
    Line1 = fgetl(out1);
    Line2 = fgetl(out2);
    Line3 = fgetl(out3);
    Line4 = fgetl(out4);
       if (i==6) %if2
        V_in = Line1(42:length(Line1));
        V_in = str2num(V_in);
        V_out = Line2(42:length(Line2));
        V_out = str2num(V_out);
        P_out = Line3(42:length(Line3));
        P_out = str2num(P_out);
        P_in = Line4(42:length(Line4));
        P_in = str2num(P_in);
    end %if2
end
fclose('all')
T1=-mdot *( V_out- V_in)
T2=-(P_out-P_amb)*S_out 