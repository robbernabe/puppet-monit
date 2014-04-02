class monit ( $alert_email=undef ) {

  class { 'monit::package':
    notify => Class['monit::service'],
  }

  class { 'monit::config':
    notify  => Class['monit::service'],
    require => Class['monit::package'],
  }

  class { 'monit::service':
    require => Class['monit::config'],
  }

  # Gunicorn Check
  file { '/etc/monit/conf.d/gunicorn.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Class['monit::package'],
    content => template('monit/gunicorn.conf.erb'),
    notify  => Class['monit::service'],
  }

  # Jasper Check
  file { '/etc/monit/conf.d/jasper.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Class['monit::package'],
    content => template('monit/jasper.conf.erb'),
    notify  => Class['monit::service'],
  }

  # Celery Check
  file { '/etc/monit/conf.d/celeryd.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Class['monit::package'],
    content => template('monit/celeryd.conf.erb'),
    notify  => Class['monit::service'],
  }

  # Filesystem Check
  file { '/etc/monit/conf.d/filesystem.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Class['monit::package'],
    content => template('monit/filesystem.conf.erb'),
    notify  => Class['monit::service'],
  }

  # General Health Check
  file { '/etc/monit/conf.d/system.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Class['monit::package'],
    content => template('monit/system.conf.erb'),
    notify  => Class['monit::service'],
  }

}
