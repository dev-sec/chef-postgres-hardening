# encoding: utf-8
name             'postgres-hardening'
maintainer       'Christoph Hartmann'
maintainer_email 'chris@lollyrock.com'
license          'Apache v2.0'
description      'Installs and configures a secure posgres server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.2.0'

depends 'postgresql', '>= 6.0.0'

recipe 'postgresql-hardening::default', 'calls hardening recipe'
recipe 'postgresql-hardening::hardening', 'add hardening configuration postgresql server'

supports 'amazon'
supports 'redhat'
supports 'centos'
supports 'fedora'
supports 'debian'
supports 'ubuntu'

source_url 'https://github.com/dev-sec/chef-postgres-hardening'
issues_url 'https://github.com/dev-sec/chef-postgres-hardening/issues'
