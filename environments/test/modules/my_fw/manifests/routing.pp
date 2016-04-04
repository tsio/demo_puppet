class my_fw::routing {
  firewall { "200 accept SRM and GridFTP from 134.94.32.89 (lofar-srm) to ${my_eth_private_ipaddress}":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '134.94.32.89/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    sport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "201 accept SRM and GridFTP from 134.94.32.90 (lofar-download) to ${my_eth_private_ipaddress}":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '134.94.32.90/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    sport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "202 accept SRM and GridFTP from 134.94.32.232 (dC9) to ${my_eth_private_ipaddress}":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '134.94.32.232/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    sport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "203 accept SRM and GridFTP from 134.94.32.233 (dC10) to ${my_eth_private_ipaddress}":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '134.94.32.233/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    sport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "204 accept SRM and GridFTP from 134.94.32.234 (dC11) to ${my_eth_private_ipaddress}":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '134.94.32.234/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    sport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "205 accept SRM and GridFTP from 134.94.32.235 (dC12) to ${my_eth_private_ipaddress}":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '134.94.32.235/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    sport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "206 accept SRM and GridFTP from 134.94.32.236 (dC13) to ${my_eth_private_ipaddress}":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '134.94.32.236/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    sport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "207 accept SRM and GridFTP from 134.94.32.237 (dC14) to ${my_eth_private_ipaddress}":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '134.94.32.237/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    sport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "208 accept SRM and GridFTP from 134.94.32.238 (dC15) to ${my_eth_private_ipaddress}":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '134.94.32.238/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    sport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "209 accept SRM and GridFTP from 134.94.32.239 (dC16) to ${my_eth_private_ipaddress}":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '134.94.32.239/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    sport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "200 accept SRM and GridFTP to 134.94.32.89 (lofar-srm) from ${my_eth_private_ipaddress}":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '134.94.32.89/32',
    source      => "${my_eth_private_ipaddress}/32",
    outiface    => $my_eth_private,
    dport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "201 accept SRM and GridFTP to 134.94.32.90 (lofar-download) from ${my_eth_private_ipaddress}":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '134.94.32.90/32',
    source      => "${my_eth_private_ipaddress}/32",
    outiface    => $my_eth_private,
    dport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "202 accept SRM and GridFTP to 134.94.32.232 (dC9) from ${my_eth_private_ipaddress}":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '134.94.32.232/32',
    source      => "${my_eth_private_ipaddress}/32",
    outiface    => $my_eth_private,
    dport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "203 accept SRM and GridFTP to 134.94.32.233 (dC10) from ${my_eth_private_ipaddress}":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '134.94.32.233/32',
    source      => "${my_eth_private_ipaddress}/32",
    outiface    => $my_eth_private,
    dport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "204 accept SRM and GridFTP to 134.94.32.234 (dC11) from ${my_eth_private_ipaddress}":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '134.94.32.234/32',
    source      => "${my_eth_private_ipaddress}/32",
    outiface    => $my_eth_private,
    dport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "205 accept SRM and GridFTP to 134.94.32.235 (dC12) from ${my_eth_private_ipaddress}":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '134.94.32.235/32',
    source      => "${my_eth_private_ipaddress}/32",
    outiface    => $my_eth_private,
    dport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "206 accept SRM and GridFTP to 134.94.32.236 (dC13) from ${my_eth_private_ipaddress}":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '134.94.32.236/32',
    source      => "${my_eth_private_ipaddress}/32",
    outiface    => $my_eth_private,
    dport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "207 accept SRM and GridFTP to 134.94.32.237 (dC14) from ${my_eth_private_ipaddress}":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '134.94.32.237/32',
    source      => "${my_eth_private_ipaddress}/32",
    outiface    => $my_eth_private,
    dport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "208 accept SRM and GridFTP to 134.94.32.238 (dC15) from ${my_eth_private_ipaddress}":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '134.94.32.238/32',
    source      => "${my_eth_private_ipaddress}/32",
    outiface    => $my_eth_private,
    dport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { "209 accept SRM and GridFTP to 134.94.32.239 (dC16) from ${my_eth_private_ipaddress}":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '134.94.32.239/32',
    source      => "${my_eth_private_ipaddress}/32",
    outiface    => $my_eth_private,
    dport       => ['8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
}
