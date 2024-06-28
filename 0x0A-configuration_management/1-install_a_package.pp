# init.pp

# Install Flask package from pip3
package { 'flask':
  ensure  => '2.1.0',   # Ensure version 2.1.0 of Flask is installed
  provider => 'pip3',   # Use pip3 as the package provider
  require => Package['python3-pip'],  # Ensure python3-pip is installed first
}

