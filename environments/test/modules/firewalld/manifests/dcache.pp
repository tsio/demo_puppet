class firewalld::dcache {
  
  # define a service
  firewalld::service { 'dcache':
    short       => 'dcache',
    description => 'Open dCache ports 2288 (info), 8443 and 8445 (SRM), 2811 and 20000-25000 (GridFTP).',
    ports       => [
      {protocol   => 'tcp',
      port        => '2288',},
      {protocol   => 'tcp',
      port        => '8443',},
      {protocol   => 'tcp',
      port        => '8445',},
      {protocol   => 'tcp',
      port        => '2811',},
      {protocol   => 'tcp',
      port        => '20000-25000',},],
  }
  
}