class firewalld::checkmk {
  
  # define a service
  firewalld::service { 'checkmk':
    short       => 'checkmk',
    description => 'Open port 6556 for check mk monitoring server (134.94.105.148).',
    ports       => [{
      protocol    => 'tcp',
      port        => '6556',},],
  }
  
}