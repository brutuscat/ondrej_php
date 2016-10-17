#
# Cookbook Name:: ondrej_php
# Recipe:: default
#
# Copyright (c) 2016 Mauro Asprea, All Rights Reserved.

require 'chef/version_constraint'

# Remove legacy php packages to reduce the surface of incompatibilities
apt_package 'php5-common' do
  action :purge
end

# Ondrej's all mighty PHP repository, see: https://launchpad.net/~ondrej/+archive/ubuntu/php
apt_repository 'ondrej-php' do
  uri          'ppa:ondrej/php'
  distribution node['lsb']['codename']
  keyserver "keyserver.ubuntu.com"
  key "E5267A6C"
end

is_php7 = ->(v) { Chef::VersionConstraint.new(">= 7.0.0").include?(v) }
is_php5_6 = ->(v) {
  Chef::VersionConstraint.new(">= 5.6.0").include?(v)\
   && Chef::VersionConstraint.new("< 7.0.0").include?(v)
}

case node['php']['version']
when is_php7
  # Nothing to do for now...
when is_php5_6
  # When installing v5.6L, lets add the "compat" repository to avoid issues
  # when using other php5 packages
  apt_repository 'ondrej-php5-compat' do
    uri          'ppa:ondrej/php5-compat'
    distribution node['lsb']['codename']
    keyserver "keyserver.ubuntu.com"
    key "E5267A6C"
  end

  # Ensure that all the scripts that are executed using the command line interface
  # will continue to work as expected.
  execute "set_default_php" do
    command "update-alternatives --set php /usr/bin/php5.6"
    action :nothing
  end
end

include_recipe "php::default"

# Triggers the selection of the system php version and must only happen after the recipe has run.
ruby_block "trigger_set_default_php" do
  block do
    v = node['php']['version']
    node.default['php']['is_php5_6_version'] = Chef::VersionConstraint.new(">= 5.6.0").include?(v)\
       && Chef::VersionConstraint.new("< 7.0.0").include?(v)
  end
  notifies :run, 'execute[set_default_php]', :immediately
  only_if node['php']['is_php5_6_version']
end
