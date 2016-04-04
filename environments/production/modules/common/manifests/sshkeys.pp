class common::sshkeys {

  if $kernel == 'Linux' {
   file {
        '/root/.ssh':
        owner  => 'root',
        group  => 'root',
        ensure => directory,
    }
    $ssh_pub_keys=hiera('ssh_pub_keys',[])
    
    file { '/root/.ssh/authorized_keys':
    ensure  => file,
    backup  => false,
    content => join( [inline_template( '<%= @ssh_pub_keys.join("\n") %>'),"\n"],''),
#    content => template("common/authorized_keys.erb"),
    require => File['/root/.ssh'],
  }
    service {
    'sshd': ensure => running
    }
  }
}
