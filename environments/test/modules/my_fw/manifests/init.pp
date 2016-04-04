# /etc/puppet/modules/my_fw/manifests/init.pp
class my_fw {
  resources { 'firewall':
    purge => true
  }
  firewallchain { 'LOGGING_IN:filter:IPv4':
    ensure  => present,
  }
  firewallchain { 'LOGGING_FW:filter:IPv4':
    ensure  => present,
  }
  firewallchain { 'LOGGING_OUT:filter:IPv4':
    ensure  => present,
  }
  Firewall {
    before  => Class['my_fw::post'],
    require => Class['my_fw::pre'],
  }
  class { ['my_fw::pre', 'my_fw::post']: }
  class { 'firewall': }
}
