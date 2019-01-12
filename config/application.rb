require 'active_support/core_ext/object/blank'

# AWS
require 'aws-sdk'

Aws.config.update({
  region: ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(
    ENV['AWS_ACCESS_KEY_ID'],
    ENV['AWS_SECRET_ACCESS_KEY']
  )
})

# DynamoDB
require 'dynamoid'

Dynamoid.configure do |config|
  config.namespace = 'worktime'
  config.endpoint = 'https://localhost:3000'
end

# Development
# require 'byebug'

# require helpers
ROOT_PATH = File.expand_path('../..', __FILE__)

def require_service(service)
  require File.join(ROOT_PATH, 'app', 'services', service)
end

def require_value(value)
  require File.join(ROOT_PATH, 'app', 'values', value)
end

def require_lib(lib)
  directory = File.join(ROOT_PATH, 'app', 'lib', lib)

  Dir.children(directory).each do |file|
    require File.join(directory, file)
  end
end
