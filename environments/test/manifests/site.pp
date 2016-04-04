# /etc/puppet/manifests/site.pp

stage { 'first': before => Stage['main'], }

node 'zam1298.fz-juelich.de', 'dcache-lofar.fz-juelich.de' {
  class { 'common': stage => first, } 
  include common::sshkeys
  include common::relay

  dcache_node_lofar { 'dcache_lofar': include_tsm => false, }

  $my_eth = 'p2p1.850'
  $my_eth_ipaddress = $ipaddress_p2p1_850
  $my_eth_private = 'p2p1.730'
  $my_eth_private_ipaddress = $ipaddress_p2p1_730
  include my_fw
  include my_fw::accessinfo

}

node 'zam1299.fz-juelich.de', 'lofar-download.fz-juelich.de' {
  class { 'common': stage => first, } 

  include common::sshkeys
  include common::relay

  $my_eth = 'p2p1.850'
  $my_eth_ipaddress = $ipaddress_p2p1_850
  $my_eth_private = 'p2p1.730'
  $my_eth_private_ipaddress = $ipaddress_p2p1_730
  include my_fw
  include my_fw::routing

}

node 'test-se.fz-juelich.de' {
 
  class { 'common': stage => first, } 
 
 $my_eth = 'eno16780032'
 $my_eth_private = 'p2p1.730'
 $my_eth_private_eff = 'p2p1.731'
 
 include common::sshkeys
 include common::relay
 include firewalld::junet
 
  dcache_node_lofar { 'dcache_lofar':
    include_tsm    => false,
    include_layout => true,
    include_pm     => true,
  }

}

node 'dcache-test.fz-juelich.de' {
  class { 'common': stage => first, } 

    dcache_node_lofar {'dcache_lofar':
        include_tsm=>true,
        }
}

node 'zam926.fz-juelich.de' {
  class { 'common': stage => first, } 

  #  dcache_node_ildg {'dcache_ildg':}
  dcache_node_lofar { 'dcache_lofar': include_tsm => false, }

  $my_eth = 'eth2'
  $my_eth_ipaddress = $ipaddress_eth2
  $my_eth_private = 'eth5.730'
  $my_eth_private_ipaddress = $ipaddress_eth5_730
  include my_fw
  include my_fw::accessinfo
  #  include my_test_module
}

node 'zam477.fz-juelich.de' {
  class { 'common': stage => first, } 

  #  class  { 'dcache' :
  #      package_ensure => '2.10.37-1',
  #  }

#  $my_eth = 'eth4'
#  $my_eth_ipaddress = $ipaddress_eth4
#  $my_eth_private = 'eth1.730'
#  $my_eth_private_ipaddress = $ipaddress_eth1_730
#  include my_fw
#  include my_fw::routing
  #  include my_test_module
}

node 'dcachepool9.fz-juelich.de' {
  class { 'common': stage => first, } 

  #  dcache_node_ildg {'dcache_ildg':}
  dcache_node_lofar { 'dcache_lofar': include_tsm => true, }

  $my_eth = 'eth0.850'
  include my_fw
}

node 'dcachepool10.fz-juelich.de' {
  class { 'common': stage => first, } 

  #  dcache_node_ildg {'dcache_ildg':}
  dcache_node_lofar { 'dcache_lofar': include_tsm => true, }
  $my_eth = 'eth0.850'
  include my_fw
}

node 'dcachepool11.fz-juelich.de' {
  class { 'common': stage => first, } 

  #  dcache_node_ildg {'dcache_ildg':}
  dcache_node_lofar { 'dcache_lofar': include_tsm => true, }

  $my_eth = 'eth0.850'
  include my_fw
}

node 'dcachepool12.fz-juelich.de' {
  class { 'common': stage => first, } 

  #  dcache_node_ildg {'dcache_ildg':}
  dcache_node_lofar { 'dcache_lofar': include_tsm => true, }

  $my_eth = 'eth1.850'
  include my_fw
}

node 'dcachepool13.fz-juelich.de' {
  class { 'common': stage => first, } 

  #  dcache_node_ildg {'dcache_ildg':}
  dcache_node_lofar { 'dcache_lofar': include_tsm => true, }

  $my_eth = 'p2p1.850'
  include my_fw
}

node 'dcachepool14.fz-juelich.de' {
  class { 'common': stage => first, } 

  #  dcache_node_ildg {'dcache_ildg':}
  dcache_node_lofar { 'dcache_lofar': include_tsm => true, }

  $my_eth = 'p2p1.850'
  include my_fw
}

node 'dcachepool15.fz-juelich.de' {
  class { 'common': stage => first, } 

  #  dcache_node_ildg {'dcache_ildg':}
  dcache_node_lofar { 'dcache_lofar': include_tsm => true, }

  $my_eth = 'p4p1.850'
  include my_fw
}

node 'dcachepool16.fz-juelich.de' {
  class { 'common': stage => first, } 

  #  dcache_node_ildg {'dcache_ildg':}
  dcache_node_lofar { 'dcache_lofar': include_tsm => true, }

  $my_eth = 'p4p1.850'
  include my_fw
}

node 'dcache.fz-juelich.de' {
  class { 'common': stage => first, } 

  dcache_node_ildg { 'dcache_ildg': include_tsm => false, }

}

node 'dcachepool1.fz-juelich.de' {
  class { 'common': stage => first, } 

  dcache_node_ildg { 'dcache_ildg': include_tsm => true, }

}

node 'dcachepool2.fz-juelich.de' {
  class { 'common': stage => first, } 

  dcache_node_ildg { 'dcache_ildg': include_tsm => true, }
}
