# Here we customize MAGIC's WebDav door
#
# As of 23/2/2012 this is just ordering by name/size/date the webpage output (https://dcgftp12.pic.es:443)

class dcache::configuration::door::xrootdcms (
        $dcacheuser=$dcache::configuration::base::dcacheuser,
        $dcachegroup=$dcache::configuration::base::dcachegroup,
        $dcache_lshare_dir=$dcache::configuration::base::dcache_lshare_dir ) {

  ####################################################
  ### RESOURCE DEFINITION
  ####################################################

  file {
    [$dcache_lshare_dir,"${dcache_lshare_dir}/plugins"]:
      ensure => directory,
      owner  => $dcacheuser,
      group  => $dcachegroup,
      mode   => '0755';
    '/root/xrootd4j-cms-plugin-1.3.7.tar.gz':
      ensure => present,
      owner  => $dcacheuser,
      group  => $dcachegroup,
      mode   => '0644',
      source => 'puppet:///modules/dcache/common/root/xrootd4j-cms-plugin-1.3.7.tar.gz',
      notify => Exec['unzip_xrootd4j_cms_plugin'];
    '/etc/dcache/storage-disk.xml':
      ensure => present,
      owner  => $dcacheuser,
      group  => $dcachegroup,
      mode   => '0644',
      source => 'puppet:///modules/dcache/common/etc/dcache/storage-disk.xml';
  }

  exec { 'unzip_xrootd4j_cms_plugin':
    refreshonly => true,
    command     => "/bin/tar -xvzf /root/xrootd4j-cms-plugin-1.3.7.tar.gz -C ${dcache_lshare_dir}/plugins/",
    require     => File["${dcache_lshare_dir}/plugins"];
  }
}
