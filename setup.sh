#!/bin/bash

apt-get update
apt-get install -y ruby1.9.1 ruby1.9.1-dev make
gem install bundler --no-ri --no-rdoc
bundle install 
./bootstrap.rb $1 $2
cd /opt/chef-solo/provisioning.git/chef/
./chef_setup_execute.sh $3 $4 $5
