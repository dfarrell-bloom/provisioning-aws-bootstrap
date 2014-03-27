#!/bin/bash
sudo apt-get install -y libcurl4-openssl-dev git
\curl -sSL https://get.rvm.io | bash
bash --login <<-eof
rvm install ruby-2.1.0
gem install bundler --no-ri --no-rdoc
bundle install
./bootstrap.rb
eof
