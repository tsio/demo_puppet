class my_fw::accessinfo {
   firewall { "200 accept from 10.230.0.201 (lexar1) to ${my_eth_ipaddress} port 2288 (info)":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '10.230.0.201/32',
    destination => "${my_eth_ipaddress}/32",
    iniface     => $my_eth,
    dport       => ['2288'],
    action      => 'accept',
  }
  firewall { "201 accept from 10.230.0.202 (lexar2) to ${my_eth_ipaddress} port 2288 (info)":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '10.230.0.202/32',
    destination => "${my_eth_ipaddress}/32",
    iniface     => $my_eth,
    dport       => ['2288'],
    action      => 'accept',
  }
  firewall { "202 accept from 10.230.0.203 (lexar3) to ${my_eth_ipaddress} port 2288 (info)":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '10.230.0.203/32',
    destination => "${my_eth_ipaddress}/32",
    iniface     => $my_eth,
    dport       => ['2288'],
    action      => 'accept',
  }
  firewall { "203 accept from 10.230.0.204 (lexar4) to ${my_eth_ipaddress} port 2288 (info)":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '10.230.0.204/32',
    destination => "${my_eth_ipaddress}/32",
    iniface     => $my_eth,
    dport       => ['2288'],
    action      => 'accept',
  }
  firewall { "204 accept from 10.230.0.205 (lexar5) to ${my_eth_ipaddress} port 2288 (info)":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '10.230.0.205/32',
    destination => "${my_eth_ipaddress}/32",
    iniface     => $my_eth,
    dport       => ['2288'],
    action      => 'accept',
  }
  firewall { "205 accept from 10.230.0.206 (lexar6) to ${my_eth_ipaddress} port 2288 (info)":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '10.230.0.206/32',
    destination => "${my_eth_ipaddress}/32",
    iniface     => $my_eth,
    dport       => ['2288'],
    action      => 'accept',
  }
  firewall { "206 accept from 10.230.0.201 (lexar1) to ${my_eth_private_ipaddress} port 2288 (info)":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '10.230.0.201/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    dport       => ['2288'],
    action      => 'accept',
  }
  firewall { "207 accept from 10.230.0.202 (lexar2) to ${my_eth_private_ipaddress} port 2288 (info)":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '10.230.0.202/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    dport       => ['2288'],
    action      => 'accept',
  }
  firewall { "208 accept from 10.230.0.203 (lexar3) to ${my_eth_private_ipaddress} port 2288 (info)":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '10.230.0.203/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    dport       => ['2288'],
    action      => 'accept',
  }
  firewall { "209 accept from 10.230.0.204 (lexar4) to ${my_eth_private_ipaddress} port 2288 (info)":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '10.230.0.204/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    dport       => ['2288'],
    action      => 'accept',
  }
  firewall { "210 accept from 10.230.0.205 (lexar5) to ${my_eth_private_ipaddress} port 2288 (info)":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '10.230.0.205/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    dport       => ['2288'],
    action      => 'accept',
  }
  firewall { "211 accept from 10.230.0.206 (lexar6) to ${my_eth_private_ipaddress} port 2288 (info)":
    chain       => 'INPUT',
    proto       => 'tcp',
    source      => '10.230.0.206/32',
    destination => "${my_eth_private_ipaddress}/32",
    iniface     => $my_eth_private,
    dport       => ['2288'],
    action      => 'accept',
  }
  firewall { "200 accept to 10.230.0.201 (lexar1) from ${my_eth_ipaddress} port 2288 (info)":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    source      => "${my_eth_ipaddress}/32",
    destination => '10.230.0.201/32',
    outiface    => $my_eth,
    sport       => ['2288'],
    action      => 'accept',
  }
  firewall { "201 accept to 10.230.0.202 (lexar2) from ${my_eth_ipaddress} port 2288 (info)":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    source      => "${my_eth_ipaddress}/32",
    destination => '10.230.0.202/32',
    outiface    => $my_eth,
    sport       => ['2288'],
    action      => 'accept',
  }
  firewall { "202 accept to 10.230.0.203 (lexar3) from ${my_eth_ipaddress} port 2288 (info)":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    source      => "${my_eth_ipaddress}/32",
    destination => '10.230.0.203/32',
    outiface    => $my_eth,
    sport       => ['2288'],
    action      => 'accept',
  }
  firewall { "203 accept to 10.230.0.204 (lexar4) from ${my_eth_ipaddress} port 2288 (info)":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    source      => "${my_eth_ipaddress}/32",
    destination => '10.230.0.204/32',
    outiface    => $my_eth,
    sport       => ['2288'],
    action      => 'accept',
  }
  firewall { "204 accept to 10.230.0.205 (lexar5) from ${my_eth_ipaddress} port 2288 (info)":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    source      => "${my_eth_ipaddress}/32",
    destination => '10.230.0.205/32',
    outiface    => $my_eth,
    sport       => ['2288'],
    action      => 'accept',
  }
  firewall { "205 accept to 10.230.0.206 (lexar6) from ${my_eth_ipaddress} port 2288 (info)":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    source      => "${my_eth_ipaddress}/32",
    destination => '10.230.0.206/32',
    outiface    => $my_eth,
    sport       => ['2288'],
    action      => 'accept',
  }
  firewall { "206 accept to 10.230.0.201 (lexar1) from ${my_eth_private_ipaddress} port 2288 (info)":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    source      => "${my_eth_private_ipaddress}/32",
    destination => '10.230.0.201/32',
    outiface    => $my_eth_private,
    sport       => ['2288'],
    action      => 'accept',
  }
  firewall { "207 accept to 10.230.0.202 (lexar2) from ${my_eth_private_ipaddress} port 2288 (info)":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    source      => "${my_eth_private_ipaddress}/32",
    destination => '10.230.0.202/32',
    outiface    => $my_eth_private,
    sport       => ['2288'],
    action      => 'accept',
  }
  firewall { "208 accept to 10.230.0.203 (lexar3) from ${my_eth_private_ipaddress} port 2288 (info)":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    source      => "${my_eth_private_ipaddress}/32",
    destination => '10.230.0.203/32',
    outiface    => $my_eth_private,
    sport       => ['2288'],
    action      => 'accept',
  }
  firewall { "209 accept to 10.230.0.204 (lexar4) from ${my_eth_private_ipaddress} port 2288 (info)":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    source      => "${my_eth_private_ipaddress}/32",
    destination => '10.230.0.204/32',
    outiface    => $my_eth_private,
    sport       => ['2288'],
    action      => 'accept',
  }
  firewall { "210 accept to 10.230.0.205 (lexar5) from ${my_eth_private_ipaddress} port 2288 (info)":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    source      => "${my_eth_private_ipaddress}/32",
    destination => '10.230.0.205/32',
    outiface    => $my_eth_private,
    sport       => ['2288'],
    action      => 'accept',
  }
  firewall { "211 accept to 10.230.0.206 (lexar6) from ${my_eth_private_ipaddress} port 2288 (info)":
    chain       => 'OUTPUT',
    proto       => 'tcp',
    source      => "${my_eth_private_ipaddress}/32",
    destination => '10.230.0.206/32',
    outiface    => $my_eth_private,
    sport       => ['2288'],
    action      => 'accept',
  }
}