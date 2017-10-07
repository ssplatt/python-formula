require 'serverspec'

# Required by serverspec
set :backend, :exec


describe package('python3') do
  it { should be_installed }
end

describe package('python3-pip') do
  it { should be_installed }
end

describe file('/usr/local/lib/python3.4/dist-packages/pcapy-0.10.10.egg-info') do
  it { should exist }
  it { should be_directory }
end

describe file('/usr/local/lib/python3.4/dist-packages/SimpleDaemon-1.3.0.egg-info') do
  it { should exist }
  it { should be_directory }
end
