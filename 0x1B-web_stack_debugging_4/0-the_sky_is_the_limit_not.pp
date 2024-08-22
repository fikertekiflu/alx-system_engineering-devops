# Increases the amount of traffic an Nginx server can handle.

# Increase the ULIMIT of the default file
exec { 'fix-ulimit-for-nginx':
  command => 'sed -i "s/ULIMIT=15/ULIMIT=4096/" /etc/default/nginx',
  path    => ['/usr/local/bin', '/bin', '/usr/bin'],
  onlyif  => 'grep -q "ULIMIT=15" /etc/default/nginx', # Ensures it's only run if necessary
  notify  => Exec['nginx-restart'],  # Triggers the Nginx restart
}

# Restart Nginx
exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',
  path    => ['/usr/local/sbin', '/usr/local/bin', '/sbin', '/bin', '/usr/sbin', '/usr/bin'],
  refreshonly => true,  # Only restart if notified by the fix-ulimit-for-nginx exec
}
