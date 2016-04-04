class firewalld::junetildg {
  
  class {'firewalld::configuration':
    default_zone  => 'trusted',
  }
  
  include firewalld::dsmc
  include firewalld::checkmk
  include firewalld::iperf
  include firewalld::dcache
  
  # define a zone
  firewalld::zone { 'junetildg':
    short       => 'junetildg',
    description => 'Rules for the external connections from junetildg.',
    interfaces  => [$my_eth],
    rich_rules  => [
      # allow all from justtsms01s.zam.kfa-juelich.de (dCache TSM interface)
      {family     => 'ipv4',
      source      => {
        address   => '134.94.105.241',
        },
      log         => {
        prefix      => 'TSM-interface',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # dCache ILDG in the DMZ
      {family     => 'ipv4',
      source      => {
        address   => '134.94.32.245',
        },
      log         => {
        prefix      => 'dC',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '134.94.32.242',
        },
      log         => {
        prefix      => 'dC1',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '134.94.32.243',
        },
      log         => {
        prefix      => 'dC2',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      service     => 'ssh',
      log         => {
        prefix      => 'ssh',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      service     => 'dsmc',
      log         => {
        prefix      => 'dsmc',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address     => '134.94.105.148',},
      service     => 'checkmk',
      log         => {
        prefix      => 'checkmk',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # dcache services
      {family     => 'ipv4',
      service     => 'dcache',
      log         => {
        prefix      => 'dcache',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
    ],
  }

}