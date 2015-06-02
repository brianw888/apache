require 'spec_helper'

describe 'apache::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  describe package('apache2') do
    it { should be_installed }
  end

  describe file('/var/www/html/index.html') do
    it { should be_file }
  end

  describe command('curl localhost') do
    its(:stdout) { should match /Hello, World!/ }
  end

  describe service('apache2') do
    it { should be_running }
  end

  describe port(80) do
    it { should be_listening }
  end
end
