# init.pp

# Define file resource to create /tmp/school
file { '/tmp/school':
  ensure  => file,               # Ensure it's a regular file
  mode    => '0744',             # File permission is 0744
  owner   => 'www-data',         # File owner is www-data
  group   => 'www-data',         # File group is www-data
  content => 'I love Puppet',    # File content is 'I love Puppet'
}

