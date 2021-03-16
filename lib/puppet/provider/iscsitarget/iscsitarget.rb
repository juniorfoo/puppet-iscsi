Puppet::Type.type(:iscsitarget).provide(:iscsitarget) do
 desc 'Type for iscsiadm commands'
 commands :iscsiadm => "iscsiadm"

 def istatus  

  begin
   iscsioutput = iscsiadm('-m', 'session')
  rescue
   return false 
  end

  if iscsioutput.include? resource[:iqn]
   return true 
  else
   return false
  end
 end

 def create
  iscsiadm('--mode', 'discoverydb', '--type', 'sendtargets', '--portal', resource[:ip], '--discover')

  iscsiadm('--mode', 'node', '--targetname', resource[:iqn], '--portal', resource[:ip], '--login')
 end

 def destroy
  iscsiadm('--mode', 'node', '--targetname', resource[:iqn], '--portal', resource[:ip], '--logout')
 end

 def exists?
  istatus
 end

end
