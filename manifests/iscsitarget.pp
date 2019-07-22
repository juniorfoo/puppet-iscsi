# See README.md for details.

define iscsi::iscsitarget (
  $ensure = present,
  $ip     = undef,
  $iqn    = undef,
) {

iscsitarget { $title:
  ensure => $ensure,
  ip     => $ip,
  iqn    => $iqn,
}

}
