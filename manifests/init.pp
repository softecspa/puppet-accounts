# == Class: accounts
#
# Full description of class accounts here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class accounts(
  $query_host     = '',
  $query_url      = '',
  $query_pass     = '',
) {

  group { 'admin':
    ensure => present,
  }

}
