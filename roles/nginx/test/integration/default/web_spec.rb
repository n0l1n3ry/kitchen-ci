# use basic tests
describe package("nginx") do
  it { should be_installed }
end

describe port(80) do
  it { should be_listening }
  its('protocols') {should include 'tcp'}
end

describe port(443) do
  it { should_not be_listening }
end

describe host('localhost') do
  its('ipaddress') { should include '127.0.0.1' }
end

# implement os dependent tests
web_user = "www-data"
web_user = "nginx" if os[:family] == "centos"

describe user(web_user) do
  it { should exist }
end
