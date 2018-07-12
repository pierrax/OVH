module Ovh
  class Configuration
    attr_accessor :api_host, :api_version
    attr_accessor :application_key, :application_secret, :consumer_key
    attr_accessor :faraday
  
    def initialize
      self.api_host             =   "https://eu.api.ovh.com"
      self.api_version          =   1.0
      
      self.application_key      =   nil
      self.application_secret   =   nil
      self.consumer_key         =   nil
      
      self.faraday              =   {
        adapter:    :net_http,
        user_agent: "OVH Ruby HTTP Client",
        verbose:    false
      }
    end
    
    def verbose_faraday?
      self.faraday.fetch(:verbose, false)
    end
  
  end
end
