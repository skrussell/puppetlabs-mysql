# @summary 
#   Private class for managing MySQL package.
#
# @api private
#
class mysql::server::install {

  if $mysql::server::package_manage {

    if ($mysql::client::package_mark) {
      package { 'mysql-server':
        install_options => $mysql::server::install_options,
        mark            => $mysql::client::package_mark,
        name            => $mysql::server::package_name,
      }
    } else {
      package { 'mysql-server':
        ensure          => $mysql::server::package_ensure,
        install_options => $mysql::server::install_options,
        name            => $mysql::server::package_name,
      }
    }
  }

}
