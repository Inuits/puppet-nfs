# = Define: nfs::export
#
define nfs::export (
  $export_directory,
  $export_target,
  $ensure         = present,
  $export_options = 'no_root_squash',
) {

  if ! $::nfs::server {
    fail 'NFS server support is not enabled.'
  }

  if $ensure == present {
    concat::fragment { "export_${name}":
      target  => $::nfs::config_file,
      content => template('nfs/export.erb'),
      order   => 10,
    }
  }
}

