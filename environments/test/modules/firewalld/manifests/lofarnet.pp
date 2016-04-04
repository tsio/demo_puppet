class firewalld::lofarnet {
  
  include firewalld::iperf
  include firewalld::dcache
  
  # define a zone
  firewalld::zone { 'lofarnet':
    short       => 'lolarnet',
    description => 'Rules for the external connections from lofarnet.',
    interfaces  => [$my_eth_private],
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
      # pools in the DMZ
      {family     => 'ipv4',
      source      => {
        address   => '134.94.32.232',
        },
      log         => {
        prefix      => 'dC9',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '134.94.32.233',
        },
      log         => {
        prefix      => 'dC10',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '134.94.32.234',
        },
      log         => {
        prefix      => 'dC11',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '134.94.32.235',
        },
      log         => {
        prefix      => 'dC12',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '134.94.32.236',
        },
      log         => {
        prefix      => 'dC13',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '134.94.32.237',
        },
      log         => {
        prefix      => 'dC14',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '134.94.32.238',
        },
      log         => {
        prefix      => 'dC15',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '134.94.32.239',
        },
      log         => {
        prefix      => 'dC16',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # admin and download in the DMZ
      {family     => 'ipv4',
      source      => {
        address   => '134.94.32.240',
        },
      log         => {
        prefix      => 'lofar-srm',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '134.94.32.241',
        },
      log         => {
        prefix      => 'lofar-download',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # site-bdii in the DMZ
      {family     => 'ipv4',
      source      => {
        address   => '134.94.32.110',
        },
      log         => {
        prefix      => 'site-bdii',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # pools in the LOFAR network
      {family     => 'ipv4',
      source      => {
        address   => '10.230.0.103',
        },
      log         => {
        prefix      => 'dC9-lofarnet',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '10.230.0.104',
        },
      log         => {
        prefix      => 'dC10-lofarnet',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '10.230.0.105',
        },
      log         => {
        prefix      => 'dC11-lofarnet',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '10.230.0.106',
        },
      log         => {
        prefix      => 'dC12-lofarnet',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '10.230.0.107',
        },
      log         => {
        prefix      => 'dC13-lofarnet',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '10.230.0.108',
        },
      log         => {
        prefix      => 'dC14-lofarnet',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '10.230.0.109',
        },
      log         => {
        prefix      => 'dC15-lofarnet',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '10.230.0.110',
        },
      log         => {
        prefix      => 'dC16-lofarnet',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # admin and download in the LOFAR network
      {family     => 'ipv4',
      source      => {
        address   => '10.230.0.102',
        },
      log         => {
        prefix      => 'lofar-srm-lofarnet',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '10.230.0.101',
        },
      log         => {
        prefix      => 'lofar-download-lofarnet',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # pools in the Effelsberg network
      {family     => 'ipv4',
      source      => {
        address   => '192.168.29.11',
        },
      log         => {
        prefix      => 'dC9-effelsberg',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '192.168.29.12',
        },
      log         => {
        prefix      => 'dC10-effelsberg',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '192.168.29.13',
        },
      log         => {
        prefix      => 'dC11-effelsberg',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '192.168.29.14',
        },
      log         => {
        prefix      => 'dC12-effelsberg',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '192.168.29.16',
        },
      log         => {
        prefix      => 'dC13-effelsberg',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      source      => {
        address   => '192.168.29.17',
        },
      log         => {
        prefix      => 'dC14-effelsberg',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # admin in the Effelsberg network
      {family     => 'ipv4',
      source      => {
        address   => '192.168.29.15',
        },
      log         => {
        prefix      => 'lofar-srm-effelsberg',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # Lexar1
      {family     => 'ipv4',
      service     => 'iperf',
      source      => {
        address     => '10.230.0.201',},
      log         => {
        prefix      => 'iperf',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      service     => 'dcache',
      source      => {
        address     => '10.230.0.201',},
      log         => {
        prefix      => 'dcache',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # Lexar2
      {family     => 'ipv4',
      service     => 'iperf',
      source      => {
        address     => '10.230.0.202',},
      log         => {
        prefix      => 'iperf',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      service     => 'dcache',
      source      => {
        address     => '10.230.0.202',},
      log         => {
        prefix      => 'dcache',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # Lexar3
      {family     => 'ipv4',
      service     => 'iperf',
      source      => {
        address     => '10.230.0.203',},
      log         => {
        prefix      => 'iperf',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      service     => 'dcache',
      source      => {
        address     => '10.230.0.203',},
      log         => {
        prefix      => 'dcache',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # Lexar4
      {family     => 'ipv4',
      service     => 'iperf',
      source      => {
        address     => '10.230.0.204',},
      log         => {
        prefix      => 'iperf',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      service     => 'dcache',
      source      => {
        address     => '10.230.0.204',},
      log         => {
        prefix      => 'dcache',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # Lexar5
      {family     => 'ipv4',
      service     => 'iperf',
      source      => {
        address     => '10.230.0.205',},
      log         => {
        prefix      => 'iperf',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      service     => 'dcache',
      source      => {
        address     => '10.230.0.205',},
      log         => {
        prefix      => 'dcache',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # Lexar6
      {family     => 'ipv4',
      service     => 'iperf',
      source      => {
        address     => '10.230.0.206',},
      log         => {
        prefix      => 'iperf',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      service     => 'dcache',
      source      => {
        address     => '10.230.0.206',},
      log         => {
        prefix      => 'dcache',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      # Effelsberg
      {family     => 'ipv4',
      service     => 'iperf',
      source      => {
        address     => '192.168.29.21',},
      log         => {
        prefix      => 'iperf',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
      {family     => 'ipv4',
      service     => 'dcache',
      source      => {
        address     => '192.168.29.21',},
      log         => {
        prefix      => 'dcache',
        level       => 'info',},
      action      => {
        action_type => 'accept',},
      },
    ],
  }

}