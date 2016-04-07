#

class common  {

   case $lsbmajdistrelease
   {
    '5': 
    {   
      class { 'common::packages':  
          pkg_list => hiera('common_pkgs_5', undef),
      }
    }
    default:
     {
       class { 'common::packages':  
           pkg_list => hiera('common_pkgs', undef),
       }
      }
  }
  
  include common::repos

  $mail_forward = hiera('mail_forward','nodef')

  file {
      '/root/.forward':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => join( [inline_template( '<%= @mail_forward.join("\n") %>'),"\n"],''),
      ensure  => present,
  }

  $resolv_conf = hiera('resolv_conf','nodef')

  file {
      '/etc/resolv.conf':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => $resolv_conf,
      ensure  => present,
  }



}

#e('<%= @servers.each_with_index.map {|v,i| "#{v}\t\t#{@names[i]}\n" } %>'),
# for any node that extends common :  
#
# class foo {
#    package { "bar": ensure => installed, require => yumrepo["test-repo-www"] }
# }


#define replace_line($file, $pattern, $replacement) {
#  $pattern_no_slashes = slash_escape($pattern)
#    $replacement_no_slashes = slash_escape($replacement)
#    exec { "/usr/bin/perl -pi -e 's/^.*$pattern_no_slashes.*$/
#  $replacement_no_slashes/' '$file'":
#      onlyif => "/usr/bin/perl -ne 'BEGIN { \$ret = 1; } \$ret = 0 if /
#    $pattern_no_slashes/ && ! /$replacement_no_slashes/ ; END { exit \
#  $ret; }' '$file'",
#    }
# 
#} 
#define line($file, $line, $ensure = 'present') {
#   case $ensure {
#      default : { err ( "unknown ensure value ${ensure}" ) }
#      present: {
#         exec { "/bin/echo '${line}' >> '${file}'":
#            unless => "/bin/grep -qFx '${line}' '${file}'"
#         }
#      }
#      absent: {
#         exec { "/usr/bin/perl -ni -e 'print unless /^\\Q${line}\\E\$/' '${file}'":
#            onlyif => "/bin/grep -qFx '${line}' '${file}'"
#         }
#      }
#   }
#}

# Ensure that the value of "$key" in "$file" is "$value"
# assumes that "$key" is at *beginning* of the line
# whitespace around delimiter is ignored ("$key$delim$value" == "$key $delim $value")

## This handles syntax differences between BSD sed and GNU sed
#$sed_extension = $operatingsystem ? {
#  Darwin  => "''",
#  Debian  => "",
#  default => "",
#}

#define ensure_key_value($file, $key, $value, $delimiter = " ") {
#  # Append line if "$key" not in "$file"
#  exec { "echo '$key$delimiter$value' >> $file":
#    unless => "grep -qe '^$key[[:space:]]*$delimiter' -- '$file'",
#    path   => "/bin:/usr/bin"
#  }

#  # Update it if it already exists...
#  exec { "sed -i $sed_extension 's/^$key$delimiter.*$/$key$delimiter$value/g' '$file'":
#    unless => "grep -xqe '$key[[:space:]]*$delimiter[[:space:]]*$value' -- '$file'",
#   path   => "/bin:/usr/bin"
#  }
#}


