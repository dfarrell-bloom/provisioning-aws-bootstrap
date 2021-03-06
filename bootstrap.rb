#!/usr/bin/env ruby

require 'json' 
require 'aws-sdk'
require 'fileutils'

AWS.config(:credential_provider => AWS::Core::CredentialProviders::EC2Provider.new)

s3bucket = ARGV[0]
s3object = ARGV[1]
path     = "/opt/chef-solo/provisioning.git"
s3 = AWS::S3.new()



FileUtils.rm_r path if File.exists? path
FileUtils.mkdir_p path
IO.popen( "tar xvjp -C '#{path}'", "w" ) do |p|
    s3.buckets[ s3bucket ].objects[ s3object ].read do |chunk|
	p.write chunk
    end
end
