# Change OS configuration so that it is possible to login with the holberton user and open a file without any error message

exec { 'change user limits':
  provider => shell,
  command  => 'sed -i -e "s/nofile 5/nofile 50000/" /etc/security/limits.conf',
  before   => exec['change'],
}

exec {'change':
  provider => shell,
  command  => 'sed -i -e "s/nofile 4/nofile 40000/" /etc/security/limits.conf',
}