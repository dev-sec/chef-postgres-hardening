# encoding: utf-8

require 'spec_helper'

describe 'postgres-hardening::default' do

  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  before do
    @postgres_version = '9.3'
    stub_command("ls /var/lib/postgresql/#{@postgres_version}/main/recovery.conf").and_return(true)
    stub_command("ls -l /var/lib/postgresql/#{@postgres_version}/main/server.crt |grep /etc/ssl/certs/ssl-cert-snakeoil.pem").and_return(true)
    stub_command("ls -l /var/lib/postgresql/#{@postgres_version}/main/server.key |grep /etc/ssl/private/ssl-cert-snakeoil.key").and_return(true)
  end

  it 'includes postgres-hardening::hardening recipe' do
    expect(chef_run).to include_recipe('postgres-hardening::hardening')
  end

end
