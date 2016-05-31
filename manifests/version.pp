define golang::version() {
  $version = $name

  $file = "go${version}.linux-amd64.tar.gz"
  $url = "https://storage.googleapis.com/golang/${file}"

  exec { "golang-download ${version}":
    command => "wget -O /usr/local/${file} ${url}",
    creates => "/usr/local/${file}",
  }

  file { "/usr/local/go-${version}":
    ensure  => directory,
    require => Exec["golang-download ${version}"],
  }

  exec { "golang-extract ${version}":
    command => "tar -xvxf /usr/local/${file} -C /usr/local/go-${version} --strip 1",
    creates => "/usr/local/go-${version}/bin",
    require => File["/usr/local/go-${version}"],
  }
}
