class dcache::config ($conf = 'nodef',) {
  $dcache_conf = $conf

  if ($dcache_conf != 'nodef') {
    file { "${dcache::dcache_etc_dir}/dcache.conf":
      owner   => $dcache::dcacheuser,
      group   => $dcache::dcachegroup,
      mode    => '0644',
      content => template('dcache/dcache.conf.erb');
    }
  }
}
