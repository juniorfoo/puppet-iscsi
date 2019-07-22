Puppet::Type.type(:iscsitarget).provide(:iscsitarget) do

 commands :iscsiadm => "iscsiadm"

 def istatus  
  desc "The try-catch statement is used to filter out nonzero exit codes when no targets are logged into"

  begin
   iscsioutput = iscsiadm('-m', 'session')
  rescue
   return false 
  end

  desc "Check whether IQN is currently logged into"
  if iscsioutput.include? resource[:iqn]
   return true 
  else
   return false
  end
 end

 def create
  desc "First discover before logging in"
  iscsiadm('--mode', 'discoverydb', '--type', 'sendtargets', '--portal', resource[:ip], '--discover')

  iscsiadm('--mode', 'node', '--targetname', resource[:iqn], '--portal', resource[:ip], '--login')
 end

 def destroy
  desc "Just log out"
  iscsiadm('--mode', 'node', '--targetname', resource[:iqn], '--portal', resource[:ip], '--logout')
 end

 def exists?
  istatus
 end

end
