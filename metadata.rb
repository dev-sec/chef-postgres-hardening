name             "postgres-hardening"
maintainer       "Christoph Hartmann"
maintainer_email "chris@lollyrock.com"
license          "Apache v2.0"
description      "Installs and configures a secure posgres server"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends 'postgresql', '>= 3.4.0'

recipe 'postgresql-hardening::default', 'installs a hardened postgresql server'
recipe 'postgresql-hardening::server', 'installs a hardened postgresql server'

supports 'amazon'
supports 'redhat'
supports 'centos'
supports 'fedora'
supports 'debian'
supports 'ubuntu'
