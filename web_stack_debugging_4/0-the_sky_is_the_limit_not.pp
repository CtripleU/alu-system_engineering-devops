# Fix problem of high amount of requests

exec {'change':
  provider => shell,
  command  => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
  before   => exec['nginx'],
}

exec {'nginx':
  provider => shell,
  command  => 'sudo service nginx restart',
}