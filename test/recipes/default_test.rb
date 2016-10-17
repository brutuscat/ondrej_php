# # encoding: utf-8

# Inspec test for recipe ondrej_php::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe command('php -v') do
  its('stdout') { should match /\APHP 5\.6\./ }
end

describe service('php5.6-fpm') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
