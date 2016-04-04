#
# door specific configuration
#

class dcache::configuration::door::nfsv41 ( $instance=$dcache::configuration::base::instance ) {

  # Configure exports and NFSv41 related
  package { 'nfs4-acl-tools': ensure => installed; }

  # class ldap - configure ldap client
  class { 'common::ldap':; }

  concat {'/etc/exports': require => Package['nfs4-acl-tools']; }

  case $instance {
    'test': {
      common::nfs::exports { '/pnfs':
        v4_export_root => '',
        ensure         => 'present',
        clients        => "dcdoor??-test.${domain}(no_dcap,rw,no_root_squash) ui??.${domain}(no_dcap,rw) ui??-test.${domain}(no_dcap,rw)";
      }
    }
    'dev': {
      common::nfs::exports { '/pnfs':
        v4_export_root => '',
        ensure         => 'present',
        clients        => "dcdoor??-dev.${domain}(no_dcap,rw,no_root_squash) ui??.${domain}(no_dcap,rw) ui??-test${domain}(no_dcap,rw)";
      }
    }
    'pps': {
                        common::nfs::exports { '/':
                                v4_export_root => '',
                                ensure         => 'present',
                                clients        => 'localhost(no_dcap,rw)';
                        }
      common::nfs::exports { '/pnfs':
        v4_export_root => '',
        ensure         => 'present',
        clients        => "dcdoor??-pps.${domain}(no_dcap,rw,no_root_squash) ui??.${domain}(no_dcap,rw) ui??-test${domain}(no_dcap,rw) localhost(no_dcap,rw) dc*.pic.es(rw,no_root_squash)";
      }
    }
    'prod': {
      common::nfs::exports { '/pnfs':
        v4_export_root => '',
        ensure         => 'present',
        clients        => "dcdoor0?.${domain}(no_dcap,ro) xrootd-at?.${domain}(no_dcap,ro) xrootd-cmst1.${domain}(no_dcap,ro) xrootd02-cmst1.${domain}(no_dcap,ro)";
      }
      common::nfs::exports { 'at3/tape': # at3/ will be ignored by the common::nfs::exports
        v4_export_root => '/pnfs/pic.es/data/at3',
        ensure         => 'present',
        clients        => "at3??.${domain}(no_dcap,rw) at3??-test.${domain}(no_dcap,rw) ui??.${domain}(no_dcap,ro) at3-admin.${domain}(no_dcap,rw,no_root_squash)";
      }
      common::nfs::exports { 'at3/disk': # at3/ will be ignored by the common::nfs::exports
        v4_export_root => '/pnfs/pic.es/data/at3',
        ensure         => 'present',
        clients        => "at3??.${domain}(no_dcap,rw) at3??-test.${domain}(no_dcap,rw) td???.${domain}(no_dcap,rw) ui??.${domain}(no_dcap,ro) at3-admin.${domain}(no_dcap,rw,no_root_squash)";
      }
                        common::nfs::exports { 'vip':
                                v4_export_root => '/pnfs/pic.es/data',
                                ensure         => 'present',
                                clients        => "ui??.${domain}(no_dcap,rw) ui01-test.${domain}(no_dcap,rw) td???.${domain}(no_dcap,rw) dc016.${domain}(no_dcap,rw)";  #muntatge temporal  a dc016
                        }
      common::nfs::exports { 'SIM':
        v4_export_root => '/pnfs/pic.es/data/vo.astro.pic.es/euclid',
        ensure         => 'present',
        clients        => "ui.euclid.${domain}(no_dcap,rw) td???.${domain}(no_dcap,rw) wn??.euclid.${domain}(no_dcap,rw) wn.astro.${domain}(no_dcap,rw)";
      }
      common::nfs::exports { 'EAS':
        v4_export_root => '/pnfs/pic.es/data/vo.astro.pic.es/euclid',
        ensure         => 'present',
        clients        => "ui.euclid.${domain}(no_dcap,rw)";
      }
      common::nfs::exports { 'shared':
        v4_export_root => '/pnfs/pic.es/data/vo.astro.pic.es/euclid',
        ensure         => 'present',
        clients        => "ui.euclid.${domain}(no_dcap,rw)";
      }
      common::nfs::exports { 'fmat2':
        v4_export_root => '/pnfs/pic.es/data',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,ro) td???.${domain}(no_dcap,rw) himec??.${domain}(no_dcap,rw) at3??.${domain}(no_dcap,ro) data.astro.${domain}(no_dcap,rw)";
      }
      common::nfs::exports { 'biocomp':
        v4_export_root => '/pnfs/pic.es/data',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,ro) td???.${domain}(no_dcap,ro)";
      }
      common::nfs::exports { 'phys.vo.ibergrid.eu':
        v4_export_root => '/pnfs/pic.es/data',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,ro) td???.${domain}(no_dcap,ro)";
      }
      common::nfs::exports { 'vo.paus.pic.es':
        v4_export_root => '/pnfs/pic.es/data',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,rw) td???.${domain}(no_dcap,rw) services.astro.${domain}(no_dcap,rw) himec??.${domain}(no_dcap,rw) wn.astro.${domain}(no_dcap,rw) ui01-test.${domain}(no_dcap,rw)";
      }
      common::nfs::exports { 'vo.cta.in2p3.fr':
        v4_export_root => '/pnfs/pic.es/data',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,ro) td???.${domain}(no_dcap,ro)";
      }
      common::nfs::exports { 'cms':
        v4_export_root => '/pnfs/pic.es/data',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,ro) td???.${domain}(no_dcap,ro)";
      }
      common::nfs::exports { 'vo.astro.pic.es':
        v4_export_root => '/pnfs/pic.es/data',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,ro)";
      }
      common::nfs::exports { 'lhcb':
        v4_export_root => '/pnfs/pic.es/data',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,ro) td???.${domain}(no_dcap,ro)";
      }
      common::nfs::exports { 'magic':
        v4_export_root => '/pnfs/pic.es/data',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,ro) td???.${domain}(no_dcap,ro)";
      }
      common::nfs::exports { 'archive':
        v4_export_root => '/pnfs/pic.es/data',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,ro) td???.${domain}(no_dcap,ro)";
      }
      common::nfs::exports { 'atlas':
        v4_export_root => '/pnfs/pic.es/data',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,ro) td???.${domain}(no_dcap,ro)";
      }
      common::nfs::exports { 't2k.org':
        v4_export_root => '/pnfs/pic.es/data',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,rw) himec??.${domain}(no_dcap,rw) td???.${domain}(no_dcap,ro)";
      }
      common::nfs::exports { 'ops':
        v4_export_root => '/pnfs/pic.es/data',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,ro) td???.${domain}(no_dcap,ro)";
      }
      common::nfs::exports { 'dteam':
        v4_export_root => '/pnfs/pic.es/data',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,ro) td???.${domain}(no_dcap,ro)";
      }
      common::nfs::exports { 'IFAEAtlasTier2':
        v4_export_root => '/pnfs/pic.es',
        ensure         => 'present',
        clients        => "ui??.${domain}(no_dcap,ro) at3??.${domain}(no_dcap,ro) td???.${domain}(no_dcap,ro)";
      }
    }
  }
}
