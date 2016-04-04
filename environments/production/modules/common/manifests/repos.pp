class common::repos {
  
   yumrepo { 'test-repo-www':
      baseurl  => 'http://dcache-test.fz-juelich.de/repo/',
      descr    => 'Test FZJ Lofar repository',
      enabled  => 1,
      gpgcheck => 0,
   }
 
   exec { 'refresh_yum_cache':
    command => 'yum clean expire-cache',
    path    => '/usr/bin/:/usr/local/bin/:/bin/',
    require => Yumrepo['test-repo-www'],
   }
   
}


# for any node that extends common :  
#
# class foo {
#    package { "bar": ensure => installed, require => yumrepo["test-repo-www"] }
# }
#
#