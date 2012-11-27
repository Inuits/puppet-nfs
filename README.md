# Puppet NFS

## Requirements

* [concat module](https://github.com/ripienaar/puppet-concat)

## Tested on...

* Debian 5 (Lenny)
* Debian 6 (Squeeze)

## Example usage

### Install NFS client tools

    node /box/ {
      include nfs
    }

### Install NFS client and server

    node /box/ {
      class { 'nfs':
        server => true;
      }
    }

### Export NFS shares

    node /box/ {
      class { 'nfs':
        server => true;
      }

      nfs::export { '/srv/nfs01 10.0.1.1/24':
        export_directory => '/srv/nfs01',
        export_target    => '10.0.1.1/24',
        export_options   => 'rw,sync,no_root_squash',
      }

      nfs::export { '/srv/nfs01 10.0.2.1/24':
        export_directory => '/srv/nfs01',
        export_target    => '10.0.2.1/24',
        export_options   => 'rw,sync,no_root_squash',
      }
    }

