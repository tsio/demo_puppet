class firewalld::iperf {
  
  # define a service
  firewalld::service { 'iperf':
    short       => 'iperf',
    description => 'Open port 24000 for iperf.',
    ports       => [{
      protocol    => 'tcp',
      port        => '24000',},],
  }
  
}