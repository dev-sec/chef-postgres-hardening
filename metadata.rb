name             "postgres-hardening"
maintainer       "Christoph Hartmann"
maintainer_email "chris@lollyrock.com"
license          "Apache v2.0"
description      "Installs and configures a secure posgres server"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.1.0"

depends 'postgresql', '>= 3.4.0'

recipe 'postgresql-hardening::default', 'calls hardening recipe'
recipe 'postgresql-hardening::hardening', 'add hardening configuration postgresql server'

supports 'amazon'
supports 'redhat'
supports 'centos'
supports 'fedora'
supports 'debian'
supports 'ubuntu'
