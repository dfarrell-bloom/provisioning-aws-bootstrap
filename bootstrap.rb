#!/usr/bin/env ruby

require 'json' 
require 'aws-sdk'

AWS.config(:credential_provider => AWS::Core::CredentialProviders::EC2Provider.new)

provisioning_bucket = ARGV[0]

s3 = AWS::S3.new( )

s3.buckets[ provisioning_bucket ].objects.each do |obj|
    puts obj.key
end
