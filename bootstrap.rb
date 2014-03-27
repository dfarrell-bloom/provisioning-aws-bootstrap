#!/usr/bin/env ruby

require 'uri'

provisioning_role = ARGV[1]

creds `curl "curl http://169.254.169.254/latest/meta-data/iam/security-credentials/#{URI.escape provisioning_role}"`
