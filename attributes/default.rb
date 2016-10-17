
# Will be used to lock on the php version
default['php']['install_method'] = 'package'
default['php']['bin'] = 'php'
default['php']['pear'] = 'pear'
default['php']['pecl'] = 'pecl'

default['php']['version_major'] = '5'
default['php']['version_minor'] = '6'
default['php']['version_patch'] = '26'
default['php']['version'] = "#{node['php']['version_major']}.#{node['php']['version_minor']}.#{node['php']['version_patch']}"
# To avoid pollution with unwanted packages
default['php']['package_options'] = '--no-install-recommends'
default['php']['packages'] = %w(php5.6-bcmath php5.6-json php-memcached php5.6-intl php5.6-curl php5.6-cli php5.6 php5.6-fpm php5.6-mysql php-pear)

default['php']['conf_dir'] = '/etc/php/5.6/cli'
default['php']['ext_conf_dir']  = '/etc/php/5.6/mods-available'
default['php']['curl']['package'] = 'php5.6-curl'
default['php']['mysql']['package'] = 'php5.6-mysql'
default['php']['fpm_socket'] = '/var/run/php/php5.6-fpm.sock'
default['php']['fpm_package'] = 'php5.6-fpm'
default['php']['fpm_pooldir'] = '/etc/php/5.6/fpm/pool.d'
default['php']['fpm_user'] = 'www-data'
default['php']['fpm_group'] = 'www-data'
default['php']['fpm_listen_user'] = 'www-data'
default['php']['fpm_listen_group'] = 'www-data'
default['php']['fpm_service'] = 'php5.6-fpm'
default['php']['fpm_default_conf'] = '/etc/php/5.6/fpm/pool.d/www.conf'
default['php']['enable_mod'] = '/usr/sbin/phpenmod'
default['php']['disable_mod'] = '/usr/sbin/phpdismod'
