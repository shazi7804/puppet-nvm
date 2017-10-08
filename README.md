# puppet module nvm
[![Build Status](https://travis-ci.org/shazi7804/puppet-nvm.svg?branch=master)](https://travis-ci.org/shazi7804/puppet-nvm)


#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with nvm](#setup)
    * [Beginning with nvm](#beginning-with-nvm)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The nvm module installs, configures, and manages the nvm service across a range of operating systems and distributions.

## Setup

### Beginning with nvm

`include '::nvm'` is enough to get you up and running.

## Usage

All parameters for the ntp module are contained within the main `::nvm` class, so for any function of the module, set the options you want. See the common usages below for examples.

### Install and enable nvm

```puppet
include '::nvm'
```

### Install specially node version. default '6'

```puppet
class { 'nvm':
  node_version => '6.11',
}
```

### Set default node version.

```puppet
class { 'nvm':
  node_version => '6.11',
  set_default  => true,
}
```

### Download package to Use a Proxy

```puppet
class { 'nvm':
  http_proxy   => 'http://change.proxy.com:3128',
  node_version => '8',
}
```

## Reference

### Classes

#### Public classes

* nvm: Main class, includes all other classes.

#### Private classes

* nvm::install Handles the packages.
* nvm::install::node Handles the node packages.
* nvm::config Handles the config.


## Limitations

This module cannot guarantee installation of nvm versions that are not available on  platform repositories.

This module is officially [supported](https://forge.puppetlabs.com/supported) for the following Java versions and platforms:

## Development

Puppet modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great. Please follow our guidelines when contributing changes.

For more information, see our [module contribution guide.](https://docs.puppetlabs.com/forge/contributing.html)

### Contributors

To see who's already involved, see the [list of contributors.](https://github.com/puppetlabs/puppetlabs-ntp/graphs/contributors)
