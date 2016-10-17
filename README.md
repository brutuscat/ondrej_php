# Ondřej PHP Wrapper Cookbook

> Installs and maintains the [Ondřej Surý Co-installable PHP](https://launchpad.net/~ondrej/+archive/ubuntu/php) versions and php modules

Using some of Ondřej's instructions about [how to migrate to the "ondrej-php" ppa](https://github.com/oerdnj/deb.sury.org/wiki/PPA-migration-to-ppa:ondrej-php), it wraps the official [Chef PHP](https://github.com/chef-cookbooks/php) cookbook, installing the proper PPA and updating the default attribute values for the original recipes to work correctly.

## Requirements

- Chef 12
- Ubuntu LTS 14.04 or 16.04
- Manual configuration according to the chosen PHP version
- [ChefDK](https://github.com/chef/chef-dk)

## KUDOS

- [Ondřej Surý](https://deb.sury.org/) ([oerdnj](https://github.com/oerdnj))
