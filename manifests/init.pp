# Class golang
# ===========================
#
# Installs a specified version of go
#
# Parameters
# ----------
#
# * `version`
# Optional. The version of go to install. Defaults to 1.6.2
#
# * `additional_versions`
# Optional. Array of version strings of additonal versions of go to install.
#
# Examples
# --------
#
# @example
#   class { '::golang':
#     version => '1.5.2',
#     additional_versions => ['1.5.1'],
#   }
#
class golang(
  $version = '1.6.3',
  $additional_versions = [],
) {

  ::golang::version { $version: }

  file { '/usr/local/go':
    ensure  => link,
    target  => "/usr/local/go-${version}",
    require => Exec["golang-extract ${version}"],
  }

  file { '/etc/profile.d/golang.sh':
    ensure  => present,
    content => "export GOROOT=/usr/local/go\nexport PATH=\$PATH:\$GOROOT/bin"
  }

  if !empty($additional_versions) {
    ::golang::version { $additional_versions: }
  }
}
