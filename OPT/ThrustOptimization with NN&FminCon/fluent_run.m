function fluent_run()
 if exist('nozzle03.cas')~=0
    delete('nozzle03.cas')
    end 
 if exist('nozzle03.dat')~=0
    delete('nozzle03.dat')
 end
 if exist('mdist.txt')~=0
    delete('mdist.txt')
 end
 if exist('mach_out.txt')~=0
    delete('mach_out.txt')
 end
 if exist('mout.txt')~=0
    delete('mout.txt')
 end
 if exist('pout.txt')~=0
    delete('pout.txt')
 end
  if exist('pin.txt')~=0
    delete('pin.txt')
 end

  if exist('vout.txt')~=0
    delete('vout.txt')
  end
 if exist('vin.txt')~=0
    delete('vin.txt')
 end
system('"C:\Fluent6326x64\ntbin\win64\fluent.exe" -r6.3.26 2d -t4 -wait -i new_fluent_journal.jou')
end
