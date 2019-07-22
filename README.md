# iscsi 

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with isccsi](#setup)
    * [What iscsi affects](#what-iscsi-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with iscsi](#beginning-with-iscsi)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This module installs and configures open-iscsi. Furthermore this module
also enables one to log in to one or multiple targets. To keep the scope
of this module to only one task. Another module can be used in addition
to mount the target's filesystem.

The advantage of using this module is that you can selectively specify
which target IQNs you want to log in to. However, I still recommend to
implement something like LUN-masking in order to enforce selective access
on both sides.

## Setup

### What iscsi affects

This module affects the installation of open-iscsi as well as the targets
to which the initiator is currently logged into.

### Setup Requirements

* Puppet >= 5.00
* [Stdlib Module](https://forge.puppet.com/puppetlabs/stdlib)

### Beginning with iscsi

## Usage

By default the module is configured to work with Hiera. An example
configuration of a hiera yaml file can be found below.

```yaml
---
classes:
  - iscsi

 iscsi::startupmode: 'automatic'

iscsi::iscsitarget:
 'data':
  ip: '192.168.1.1'
  iqn: 'iqn-as-configured-on-target'
```

## Limitations

Currently the following limitations exist with this module:
* No fully worked out rspec
* Only support for Debian and Ubuntu
* The provider and custom type currently only support two parameters (ip and iqn). However this can be easily extended.


