class my_fw::post {
  firewall { '900 forward to LOGGING_IN':
    chain  => 'INPUT',
    jump   => 'LOGGING_IN',
    proto  => 'all',
    before => undef,
  }
  firewall { '901 deny all other input requests':
    chain  => 'INPUT',
    action => 'reject',
    proto  => 'all',
    before => undef,
  }
  firewall { '900 forward to LOGGING_FW':
    chain  => 'FORWARD',
    jump   => 'LOGGING_FW',
    proto  => 'all',
    before => undef,
  }
  firewall { '901 deny all other forward requests':
    chain  => 'FORWARD',
    action => 'reject',
    proto  => 'all',
    before => undef,
  }
  firewall { '900 forward to LOGGING_OUT':
    chain  => 'OUTPUT',
    jump   => 'LOGGING_OUT',
    proto  => 'all',
    before => undef,
  }
  firewall { '901 deny all other output requests':
    chain  => 'OUTPUT',
    action => 'reject',
    proto  => 'all',
    before => undef,
  }
  firewall { '900 deny all other input requests':
    chain  => 'LOGGING_IN',
    action => 'reject',
    proto  => 'all',
    before => undef,
  }
  firewall { '900 deny all other forward requests':
    chain  => 'LOGGING_FW',
    action => 'reject',
    proto  => 'all',
    before => undef,
  }
  firewall { '900 deny all other output requests':
    chain  => 'LOGGING_OUT',
    action => 'reject',
    proto  => 'all',
    before => undef,
  }
}
