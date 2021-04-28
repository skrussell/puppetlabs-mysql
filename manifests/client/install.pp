# @summary
#   Private class for MySQL client install.
#
# @api private
#
class mysql::client::install {

  if $mysql::client::package_manage {

    if ($mysql::client::package_mark) {
      package { 'mysql_client':
        install_options => $mysql::client::install_options,
        mark            => $mysql::client::package_mark,
        name            => $mysql::client::package_name,
      }
    } else {
      package { 'mysql_client':
        ensure          => $mysql::client::package_ensure,
        install_options => $mysql::client::install_options,
        name            => $mysql::client::package_name,
      }
    }

  }

}
