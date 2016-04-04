class firewalld::dsmc {
  
  # define a service
  firewalld::service { 'dsmc':
    short       => 'dsmc',
    description => 'Open port 1501 for TSM dsmc tape backup.',
    ports       => [{
      protocol    => 'tcp',
      port        => '1501',},],
  }
  
}