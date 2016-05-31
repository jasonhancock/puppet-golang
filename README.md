# golang

#### Table of Contents

1. [Description](#description)
1. [Reference](#reference)
1. [Examples](#examples)

## Description

Installs and configures go

## Reference

##### `version`
  The version of Go to install.

##### `additional_versions`
  Array of additional versions of Go to install

## Examples

~~~puppet
class { '::golang':
  version => '1.5.2',
  additional_versions => ['1.5.1'],
}
~~~
