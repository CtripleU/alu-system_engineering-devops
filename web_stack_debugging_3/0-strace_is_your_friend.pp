# use `strace -p` to find issue with server. Fix error 500 issue using shell command
# issue found is that /var/www/html/wp-includes/class-wp-locale.phpp doesn't exist. The file is named wrongly

exec {'change file name':
  provider => shell,
  command  => 'sed -i "s/class-wp-locale.phpp/class-wp-locale.php/g" /var/www/html/wp-settings.php'
}