# Gems
require "faraday"
require "faraday_middleware"

# Standard library
require "digest/sha1"

# Gem
require "ovh/version"
require "ovh/configuration"

require "ovh/endpoints/consumer"
require "ovh/endpoints/account"
require "ovh/endpoints/ips"
require "ovh/endpoints/vps"

require "ovh/client"

module Ovh
  
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= ::Ovh::Configuration.new
  end

  def self.reset
    @configuration = ::Ovh::Configuration.new
  end

  def self.configure
    yield(configuration)
  end
  
end
