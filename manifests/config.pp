# PRIVATE CLASS: not to be invoked directly

class iscsi::config inherits ::iscsi {

service { 'iscsid':
  ensure  => 'running',
  enable  => true,
  require => Package['open-iscsi']
}

file { '/etc/iscsi/iscsid.conf':
  content => template('iscsi/iscsid.conf.erb'),
  owner   => root,
  group   => root,
  mode    => '0600',
  notify  => Service['iscsid']
}
  $targets = hiera(iscsi::iscsitarget, {})
  create_resources('iscsi::iscsitarget', $targets)
}
