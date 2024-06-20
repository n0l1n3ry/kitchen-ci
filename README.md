# Kitchen Test

## Installation

```bash
sudo gem install \
test-kitchen \
kitchen-ansible \
kitchen-docker \
kitchen-inspec
# Or with Gemfile (cf. kitchen.7z)
sudo apt install bundler
sudo bundler install
```

## Tests
### web_spec.rb
```rb
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

```

## Demo

We have to test the installation of NGINX on our Docker container.
The verify step will inspect if : 
- NGINX is installed
- The listening port is 80, not 443
- User www-data exists
- Host localhost resolves to 127.0.0.1

![kitchen-ci](_res/kitchen.gif)