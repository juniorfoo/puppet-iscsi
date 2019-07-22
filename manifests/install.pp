# PRIVATE CLASS: not to be invoked directly
class iscsi::install {
package { 'open-iscsi':
  ensure => 'installed',
}
}
