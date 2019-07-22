# Class: iscsi 
#
# ---
# 
# This module installs AND configures open-iscsi
# to connect to one or multiple targets. To accomplish
# this we developed a lightweight provider and custom
# type.
#
# ---
#
# Hiera is intended to be used in combination with the module.
# However, the module can also be modified to function without
#Hiera.
# $target = is to specify the target IP-address
# $iscsiStartupMode =  sets startup to manual or automatic
# ---
# Example
#
#classes:
#  - iscsi
#
# iscsi::startupmode: 'automatic'
#
#iscsi::iscsitarget:
# 'data':
#  ensure: 'present'
#  ip: '192.168.1.1'
#  iqn: 'iqn-as-configured-on-target'
#

class iscsi (
  $target           = hiera(iscsi::target,''),
  $iscsiStartupMode = hiera(iscsi::startupmode,''),
) {
  contain ::iscsi::install
  contain ::iscsi::config

  Class['iscsi::install']
  -> Class['iscsi::config']
}
