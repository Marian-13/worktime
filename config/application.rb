require 'active_support/core_ext/object/blank'

# require 'byebug'

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
