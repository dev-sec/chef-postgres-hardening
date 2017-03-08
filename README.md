# postgres-hardening (Postgres cookbook)

[![Supermarket](http://img.shields.io/cookbook/v/postgres-hardening.svg)][1]
[![Build Status](http://img.shields.io/travis/hardening-io/chef-postgres-hardening.svg)][2]
[![Code Coverage](http://img.shields.io/coveralls/hardening-io/chef-postgres-hardening.svg)][3]
[![Dependencies](http://img.shields.io/gemnasium/hardening-io/chef-postgres-hardening.svg)][4]
[![Gitter Chat](https://badges.gitter.im/Join%20Chat.svg)][5]

## Description

Provides security configurations for postgres.

Note: This is currently work in progress and not tested on all supported platforms

## Requirements

* Chef >= 12.5.1


### Platform

- Debian 7, 8
- Ubuntu 12.04, 14.04, 16.04
- RHEL 6, 7
- CentOS 6, 7
- Oracle Linux 6, 7

## Usage

This cookbook is optimized to work with [os-hardening](https://github.com/dev-sec/chef-os-hardening) and [ssh-hardening](https://github.com/dev-sec/chef-ssh-hardening). It will play well without, but you need to ensure all preconditions like `apt-get update` or `yum update` are met.

add the following to your runlist and customize security option attributes

```bash
  "recipe[postgresql::server]",
  "recipe[postgres-hardening]"
```

You should also use the official postgres packages, because those offer the latest fixes. Enable the suitable option for the [postgres cookbook](https://github.com/sous-chefs/postgresql).

```bash
"postgresql": {

   # debian, ubuntu
   "enable_pgdg_apt": true

   # rhel
   "enable_pgdg_yum": true

}
```

The hardening cookbook is only optimized for Postgresql 9.4. This can be activated for [postgres cookbook](https://github.com/sous-chefs/postgresql.

```bash
"postgresql": {
   version: "9.4"
}
```

### Enable SSL

Please read http://www.postgresql.org/docs/9.1/static/ssl-tcp.html first.

This cookbook will delete the links from `/var/lib/postgresql/#{node['postgresql']['version']}/main/server.crt` to `/etc/ssl/certs/ssl-cert-snakeoil.pem` and `/var/lib/postgresql/#{node['postgresql']['version']}/main/server.key` to `/etc/ssl/private/ssl-cert-snakeoil.key` on Debian systems. This certificates are self-signed (see http://en.wikipedia.org/wiki/Snake_oil_%28cryptography%29) and therefore not trusted. You have to provide your own trusted certificates for SSL.

## Security Options

* `node['postgresql']['config']['logging_collector'] = true`
   This parameter enables the logging collector, which is a background process
   that captures log messages sent to stderr and redirects them into log files.
   See http://www.postgresql.org/docs/9.1/static/runtime-config-logging.html for details
   Defaults to: `true`

* `node['postgresql']['config']['log_directory'] = 'pg_log'`
   When logging_collector is enabled, this parameter determines the
   directory in which log files will be created.
   See http://www.postgresql.org/docs/9.1/static/runtime-config-logging.html for details
   Defaults to: `pg_log`

* `node['postgresql']['config']['log_connections'] = true`
   Causes each attempted connection to the server to be logged, as well as successful
   completion of client authentication.
   See http://www.postgresql.org/docs/9.1/static/runtime-config-logging.html for details
   Defaults to: `true`

* `node['postgresql']['config']['log_disconnections'] = true`
   This outputs a line in the server log similar to log_connections but at session
   termination, and includes the duration of the session.
   See http://www.postgresql.org/docs/9.1/static/runtime-config-logging.html for details
   Defaults to: `true`

* `node['postgresql']['config']['log_duration'] = true`
   Causes the duration of every completed statement to be logged
   See http://www.postgresql.org/docs/9.1/static/runtime-config-logging.html for details
   Defaults to: `true`

* `node['postgresql']['config']['log_hostname'] = true`
   By default, connection log messages only show the IP address of the connecting host.
   See http://www.postgresql.org/docs/9.1/static/runtime-config-logging.html for details
   Defaults to: `true`

* `node['postgresql']['config']['log_line_prefix'] = '%t %u %d %h'`
   This is a printf-style string that is output at the beginning of each log line.
   See http://www.postgresql.org/docs/9.1/static/runtime-config-logging.html for details
   Defaults to: `%t %u %d %h`

* `node['postgresql']['config']['password_encryption'] = true`
   When a password is specified in CREATE USER or ALTER ROLE without writing either
   ENCRYPTED or UNENCRYPTED, this parameter determines whether the password is to be encrypted.
   See http://www.postgresql.org/docs/9.1/static/runtime-config-connection.html for details
   Defaults to: `true`

* `node['postgresql']['config']['ssl'] = false`
   Enables SSL connections. Please read http://www.postgresql.org/docs/9.1/static/ssl-tcp.html
   SSL certificates are out of scope of this module. This is why this setting defaults to `off`.
   You have to provide ssl certificates *before* the startup of postgres, otherwise it will fail to start.  
   See http://www.postgresql.org/docs/9.1/static/runtime-config-connection.html for details
   Defaults to: `false`

## Tests

```bash
# Install dependencies
gem install bundler
bundle install

# Do lint checks
bundle exec rake lint

# fast test on one machine
bundle exec kitchen test default-apt-ubuntu-1604

# test on all machines
bundle exec kitchen test

# for development
bundle exec kitchen create default-apt-ubuntu-1604
bundle exec kitchen converge default-apt-ubuntu-1604
```

## Contributors + Kudos

* Edmund Haselwanter [ehaselwanter](https://github.com/ehaselwanter)
* Dominik Richter [arlimus](https://github.com/arlimus)
* Christoph Hartmann [chris-rock](https://github.com/chris-rock)
* Patrick Muench [atomic111](https://github.com/atomic111)


## License and Author

* Author:: Deutsche Telekom AG

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[1]: https://supermarket.chef.io/cookbooks/postgres-hardening
[2]: http://travis-ci.org/dev-sec/chef-postgres-hardening
[3]: https://coveralls.io/r/dev-sec/chef-postgres-hardening
[4]: https://gemnasium.com/dev-sec/chef-postgres-hardening
[5]: https://gitter.im/dev-sec/general
