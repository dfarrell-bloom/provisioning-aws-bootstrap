#!/usr/bin/env ruby

require 'json' 
require 'aws-sdk'

AWS.config(:credential_provider => AWS::Core::CredentialProviders::EC2Provider.new)

s3bucket = ARGV[0]
s3object = ARGV[1]

s3 = AWS::S3.new()

popen( "tar xvjp -C /opt/provisioning.git", "w" ) do |p|
    s3.buckets[ s3bucket ].objects[ s3object ].write p:w
end
