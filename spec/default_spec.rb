# encoding: utf-8

require 'spec_helper'

describe 'postgres-hardening::default' do

  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'includes postgres-hardening::hardening recipe' do
    expect(chef_run).to include_recipe('postgres-hardening::hardening')
  end

end
