class my_fw::pre {
  Firewall {
    require => undef,
  }
  firewall { '000 forward 91.234.26.6 to LOGGING_IN':
    chain  => 'INPUT',
    jump   => 'LOGGING_IN',
    proto  => 'all',
    source => '91.234.26.6/32',
  }
  firewall { '001 forward 187.63.160.3 to LOGGING_IN':
    chain  => 'INPUT',
    jump   => 'LOGGING_IN',
    proto  => 'all',
    source => '187.63.160.3/32',
  }
  firewall { '002 forward 185.27.36.67 to LOGGING_IN':
    chain  => 'INPUT',
    jump   => 'LOGGING_IN',
    proto  => 'all',
    source => '185.27.36.67/32',
  }
  firewall { '003 forward 71.6.128.0/17 to LOGGING_IN':
    chain  => 'INPUT',
    jump   => 'LOGGING_IN',
    proto  => 'all',
    source => '71.6.128.0/17',
  }
  firewall { '004 forward 198.20.64.0/18 to LOGGING_IN':
    chain  => 'INPUT',
    jump   => 'LOGGING_IN',
    proto  => 'all',
    source => '198.20.64.0/18',
  }
  firewall { '005 forward 66.240.236.0/24 to LOGGING_IN':
    chain  => 'INPUT',
    jump   => 'LOGGING_IN',
    proto  => 'all',
    source => '66.240.236.0/24',
  }
  firewall { '006 forward 82.221.105.0/24 to LOGGING_IN':
    chain  => 'INPUT',
    jump   => 'LOGGING_IN',
    proto  => 'all',
    source => '82.221.105.0/24',
  }
  firewall { '007 forward 203.162.8.0/21 to LOGGING_IN':
    chain  => 'INPUT',
    jump   => 'LOGGING_IN',
    proto  => 'all',
    source => '203.162.8.0/21',
  }
  firewall { '008 forward 213.30.120.214 to LOGGING_IN':
    chain  => 'INPUT',
    jump   => 'LOGGING_IN',
    proto  => 'all',
    source => '213.30.120.214/32',
  }
  #firewall { '009 forward 10.230.0.201 to LOGGING_IN':
  #  chain   => 'INPUT',
  #  jump    => 'LOGGING_IN',
  #  proto   => 'all',
  #  source  => '10.230.0.201/32',
  #}
  #firewall { '010 forward 10.230.0.202 to LOGGING_IN':
  #  chain   => 'INPUT',
  #  jump    => 'LOGGING_IN',
  #  proto   => 'all',
  #  source  => '10.230.0.202/32',
  #}
  firewall { '100 accept all from lo interface':
    chain   => 'INPUT',
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }
  firewall { "101 accept all from ${my_eth} interface":
    chain   => 'INPUT',
    proto   => 'all',
    iniface => $my_eth,
    action  => 'accept',
  }
  firewall { '102 accept related established rules':
    chain  => 'INPUT',
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }
  firewall { '103 accept all from 10.230.0.103 (dC9)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '10.230.0.103/32',
    action => 'accept',
  }
  firewall { '104 accept all from 192.168.29.11 (dC9)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '192.168.29.11/32',
    action => 'accept',
  }
  firewall { '105 accept all from 10.230.0.104 (dC10)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '10.230.0.104/32',
    action => 'accept',
  }
  firewall { '106 accept all from 192.168.29.12 (dC10)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '192.168.29.12/32',
    action => 'accept',
  }
  firewall { '107 accept all from 10.230.0.105 (dC11)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '10.230.0.105/32',
    action => 'accept',
  }
  firewall { '108 accept all from 192.168.29.13 (dC11)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '192.168.29.13/32',
    action => 'accept',
  }
  firewall { '109 accept all from 10.230.0.106 (dC12)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '10.230.0.106/32',
    action => 'accept',
  }
  firewall { '110 accept all from 192.168.29.14 (dC12)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '192.168.29.14/32',
    action => 'accept',
  }
  firewall { '111 accept all from 10.230.0.107 (dC13)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '10.230.0.107/32',
    action => 'accept',
  }
  firewall { '112 accept all from 192.168.29.16 (dC13)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '192.168.29.16/32',
    action => 'accept',
  }
  firewall { '113 accept all from 10.230.0.108 (dC14)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '10.230.0.108/32',
    action => 'accept',
  }
  firewall { '114 accept all from 192.168.29.17 (dC14)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '192.168.29.17/32',
    action => 'accept',
  }
  firewall { '115 accept all from 10.230.0.109 (dC15)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '10.230.0.109/32',
    action => 'accept',
  }
  firewall { '116 accept all from 10.230.0.110 (dC16)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '10.230.0.110/32',
    action => 'accept',
  }
  firewall { '117 accept all from 10.230.0.102 (lofar-srm)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '10.230.0.102/32',
    action => 'accept',
  }
  firewall { '118 accept all from 192.168.29.15 (lofar-srm)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '192.168.29.15/32',
    action => 'accept',
  }
  firewall { '119 accept all from 10.230.0.101 (download-server)':
    chain  => 'INPUT',
    proto  => 'all',
    source => '10.230.0.101/32',
    action => 'accept',
  }
  firewall { '120 accept icmp from 10.230.0.201 (lexar1)':
    chain  => 'INPUT',
    proto  => 'icmp',
    source => '10.230.0.201/32',
    action => 'accept',
  }
  firewall { '121 accept icmp from 10.230.0.202 (lexar2)':
    chain  => 'INPUT',
    proto  => 'icmp',
    source => '10.230.0.202/32',
    action => 'accept',
  }
  firewall { '122 accept icmp from 10.230.0.203 (lexar3)':
    chain  => 'INPUT',
    proto  => 'icmp',
    source => '10.230.0.203/32',
    action => 'accept',
  }
  firewall { '123 accept icmp from 10.230.0.204 (lexar4)':
    chain  => 'INPUT',
    proto  => 'icmp',
    source => '10.230.0.204/32',
    action => 'accept',
  }
  firewall { '124 accept icmp from 10.230.0.205 (lexar5)':
    chain  => 'INPUT',
    proto  => 'icmp',
    source => '10.230.0.205/32',
    action => 'accept',
  }
  firewall { '125 accept icmp from 10.230.0.206 (lexar6)':
    chain  => 'INPUT',
    proto  => 'icmp',
    source => '10.230.0.206/32',
    action => 'accept',
  }
  firewall { '126 accept icmp from 192.168.29.21 (Effelsberg)':
    chain  => 'INPUT',
    proto  => 'icmp',
    source => '192.168.29.21/32',
    action => 'accept',
  }
  firewall { '127 accept iperf, SRM and GridFTP from 10.230.0.201 (lexar1)':
    chain  => 'INPUT',
    proto  => 'tcp',
    source => '10.230.0.201/32',
    dport  => ['24000', '8443', '8445', '2811', '20000-25000'],
    action => 'accept',
  }
  firewall { '128 accept iperf, SRM and GridFTP from 10.230.0.202 (lexar2)':
    chain  => 'INPUT',
    proto  => 'tcp',
    source => '10.230.0.202/32',
    dport  => ['24000', '8443', '8445', '2811', '20000-25000'],
    action => 'accept',
  }
  firewall { '129 accept iperf, SRM and GridFTP from 10.230.0.203 (lexar3)':
    chain  => 'INPUT',
    proto  => 'tcp',
    source => '10.230.0.203/32',
    dport  => ['24000', '8443', '8445', '2811', '20000-25000'],
    action => 'accept',
  }
  firewall { '130 accept iperf, SRM and GridFTP from 10.230.0.204 (lexar4)':
    chain  => 'INPUT',
    proto  => 'tcp',
    source => '10.230.0.204/32',
    dport  => ['24000', '8443', '8445', '2811', '20000-25000'],
    action => 'accept',
  }
  firewall { '131 accept iperf, SRM and GridFTP from 10.230.0.205 (lexar5)':
    chain  => 'INPUT',
    proto  => 'tcp',
    source => '10.230.0.205/32',
    dport  => ['24000', '8443', '8445', '2811', '20000-25000'],
    action => 'accept',
  }
  firewall { '132 accept iperf, SRM and GridFTP from 10.230.0.206 (lexar6)':
    chain  => 'INPUT',
    proto  => 'tcp',
    source => '10.230.0.206/32',
    dport  => ['24000', '8443', '8445', '2811', '20000-25000'],
    action => 'accept',
  }
  firewall { '133 accept iperf, SRM and GridFTP from 192.168.29.21 (Effelsberg)':
    chain  => 'INPUT',
    proto  => 'tcp',
    source => '192.168.29.21/32',
    dport  => ['24000', '8443', '8445', '2811', '20000-25000'],
    action => 'accept',
  }
  firewall { '100 allow all to lo interface':
    chain    => 'OUTPUT',
    proto    => 'all',
    outiface => 'lo',
    action   => 'accept',
  }
  firewall { "101 allow all to ${my_eth} interface":
    chain    => 'OUTPUT',
    proto    => 'all',
    outiface => $my_eth,
    action   => 'accept',
  }
  firewall { '102 allow related established rules':
    chain  => 'OUTPUT',
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }
  firewall { '103 accept all to 10.230.0.103 (dC9)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '10.230.0.103/32',
    action      => 'accept',
  }
  firewall { '104 accept all to 192.168.29.11 (dC9)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '192.168.29.11/32',
    action      => 'accept',
  }
  firewall { '105 accept all to 10.230.0.104 (dC10)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '10.230.0.104/32',
    action      => 'accept',
  }
  firewall { '106 accept all to 192.168.29.12 (dC10)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '192.168.29.12/32',
    action      => 'accept',
  }
  firewall { '107 accept all to 10.230.0.105 (dC11)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '10.230.0.105/32',
    action      => 'accept',
  }
  firewall { '108 accept all to 192.168.29.13 (dC11)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '192.168.29.13/32',
    action      => 'accept',
  }
  firewall { '109 accept all to 10.230.0.106 (dC12)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '10.230.0.106/32',
    action      => 'accept',
  }
  firewall { '110 accept all to 192.168.29.14 (dC12)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '192.168.29.14/32',
    action      => 'accept',
  }
  firewall { '111 accept all to 10.230.0.107 (dC13)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '10.230.0.107/32',
    action      => 'accept',
  }
  firewall { '112 accept all to 192.168.29.16 (dC13)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '192.168.29.16/32',
    action      => 'accept',
  }
  firewall { '113 accept all to 10.230.0.108 (dC14)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '10.230.0.108/32',
    action      => 'accept',
  }
  firewall { '114 accept all to 192.168.29.17 (dC14)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '192.168.29.17/32',
    action      => 'accept',
  }
  firewall { '115 accept all to 10.230.0.109 (dC15)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '10.230.0.109/32',
    action      => 'accept',
  }
  firewall { '116 accept all to 10.230.0.110 (dC16)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '10.230.0.110/32',
    action      => 'accept',
  }
  firewall { '117 accept all to 10.230.0.102 (lofar-srm)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '10.230.0.102/32',
    action      => 'accept',
  }
  firewall { '118 accept all to 192.168.29.15 (lofar-srm)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '192.168.29.15/32',
    action      => 'accept',
  }
  firewall { '119 accept all to 10.230.0.101 (download-server)':
    chain       => 'OUTPUT',
    proto       => 'all',
    destination => '10.230.0.101/32',
    action      => 'accept',
  }
  firewall { '120 accept icmp to 10.230.0.201 (lexar1)':
    chain       => 'OUTPUT',
    proto       => 'icmp',
    destination => '10.230.0.201/32',
    action      => 'accept',
  }
  firewall { '121 accept icmp to 10.230.0.202 (lexar2)':
    chain       => 'OUTPUT',
    proto       => 'icmp',
    destination => '10.230.0.202/32',
    action      => 'accept',
  }
  firewall { '122 accept icmp to 10.230.0.203 (lexar3)':
    chain       => 'OUTPUT',
    proto       => 'icmp',
    destination => '10.230.0.203/32',
    action      => 'accept',
  }
  firewall { '123 accept icmp to 10.230.0.204 (lexar4)':
    chain       => 'OUTPUT',
    proto       => 'icmp',
    destination => '10.230.0.204/32',
    action      => 'accept',
  }
  firewall { '124 accept icmp to 10.230.0.205 (lexar5)':
    chain       => 'OUTPUT',
    proto       => 'icmp',
    destination => '10.230.0.205/32',
    action      => 'accept',
  }
  firewall { '125 accept icmp to 10.230.0.206 (lexar6)':
    chain       => 'OUTPUT',
    proto       => 'icmp',
    destination => '10.230.0.206/32',
    action      => 'accept',
  }
  firewall { '126 accept icmp to 192.168.29.21 (Effelsberg)':
    chain       => 'OUTPUT',
    proto       => 'icmp',
    destination => '192.168.29.21/32',
    action      => 'accept',
  }
  firewall { '127 accept iperf, SRM and GridFTP to 10.230.0.201 (lexar1)':
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '10.230.0.201/32',
    sport       => ['24000', '8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { '128 accept iperf, SRM and GridFTP to 10.230.0.202 (lexar2)':
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '10.230.0.202/32',
    sport       => ['24000', '8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { '129 accept iperf, SRM and GridFTP to 10.230.0.203 (lexar3)':
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '10.230.0.203/32',
    sport       => ['24000', '8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { '130 accept iperf, SRM and GridFTP to 10.230.0.204 (lexar4)':
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '10.230.0.204/32',
    sport       => ['24000', '8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { '131 accept iperf, SRM and GridFTP to 10.230.0.205 (lexar5)':
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '10.230.0.205/32',
    sport       => ['24000', '8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { '132 accept iperf, SRM and GridFTP to 10.230.0.206 (lexar6)':
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '10.230.0.206/32',
    sport       => ['24000', '8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { '133 accept iperf, SRM and GridFTP to 192.168.29.21 (Effelsberg)':
    chain       => 'OUTPUT',
    proto       => 'tcp',
    destination => '192.168.29.21/32',
    sport       => ['24000', '8443', '8445', '2811', '20000-25000'],
    action      => 'accept',
  }
  firewall { '100 log rejected input chain':
    chain      => 'LOGGING_IN',
    jump       => 'LOG',
    log_level  => '4',
    log_prefix => '[IPTABLES INPUT] rejected ',
    proto      => 'all',
  }
  firewall { '100 log rejected forward chain':
    chain      => 'LOGGING_FW',
    jump       => 'LOG',
    log_level  => '4',
    log_prefix => '[IPTABLES FORWARD] rejected ',
    proto      => 'all',
  }
  firewall { '100 log rejected output chain':
    chain      => 'LOGGING_OUT',
    jump       => 'LOG',
    log_level  => '4',
    log_prefix => '[IPTABLES OUTPUT] rejected ',
    proto      => 'all',
  }
}
