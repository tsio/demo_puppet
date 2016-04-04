class common::packages (
	$pkg_list=undef) {
	
	if $pkg_list!=undef {
	  package { $pkg_list: ensure => 'installed' }
	}
}