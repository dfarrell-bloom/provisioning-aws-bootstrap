#!/bin/bash
\curl -sSL https://get.rvm.io | bash
bash --login <<-eof
rvm install ruby-2.1.0
gem install bundler --no-ri --no-rdoc
bundle install --deployment
./bootstrap.rb
eof
