# postgres-hardening (Postgres cookbook)

## Description

Provides security configurations for postgres.

Note: This is currently work in progress and not tested on all supported platforms

## Requirements

* chef

## Usage

This cookbook is optimized to work with [os-hardening](https://github.com/TelekomLabs/postgres-os-hardening) and [ssh-hardening](https://github.com/TelekomLabs/chef-ssh-hardening). It will play well without, but you need to ensure all preconditions like `apt-get update` or `yum update` are met.

tbd.

## Security Options

## Tests

    # fast test on one machine
    kitchen test default-ubuntu-1204

    # test on all machines
    kitchen test

    # for development
    kitchen create default-ubuntu-1204
    kitchen converge default-ubuntu-1204


## Contributors + Kudos

* Edmund Haselwanter
* Dominik Richter
* Christoph Hartmann
* Patrick Meier


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
