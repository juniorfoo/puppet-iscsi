Puppet::Type.newtype(:iscsitarget) do
 @doc = "Used to log in to individual target luns"

 ensurable

 newparam(:iqn, :namevar => true) do
  desc "The IQN that's made available on the target"
 end

 newparam(:ip) do
  desc "The IP-address of the target"
 end

end
