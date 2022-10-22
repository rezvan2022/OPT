function [y,S_out]=gambit_run()
if exist('nozzle03.msh')~=0
    delete('nozzle03.msh')
end
if exist('nozzle03.dbs')~=0
    delete('nozzle03.dbs')
end
if exist('nozzle03.trn')~=0
    delete('nozzle03.trn')
end
if exist('nozzle03.jou')~=0
    delete('nozzle03.jou')
end
pause(5)
 [y,S_out]=point_gen();

 system('C:\Gambit.Inc\ntbin\ntx86\gambit.exe -r2.4.6 -inp main_gmbt_jr.jou')
