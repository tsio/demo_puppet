class common::relay {
 
  include stdlib

  package { 'postfix':
  ensure => present,
  before => File_line['/etc/postfix/main.cf:relay'],
  }
  
  service { 'postfix':
  ensure    => running,
  enable    => true,
  subscribe => File_line['/etc/postfix/main.cf:relay'],
  }
  
  file_line { '/etc/postfix/main.cf:relay':
      path    => '/etc/postfix/main.cf',
      line    => 'relayhost = mail.fz-juelich.de',
#      notify => Service['postfix'],
      require => Package['postfix'],
  }

   
   
}


# for any node that extends common :  
#
# class foo {
#    package { "bar": ensure => installed, require => yumrepo["test-repo-www"] }
# }
#
#