module Ovh
  class Client
    attr_accessor :configuration, :endpoint
    
    def initialize(configuration: ::Ovh.configuration)
      self.configuration      =   configuration
      self.endpoint           =   "#{self.configuration.api_host}/#{self.configuration.api_version}"
    end
    
    include ::Ovh::Endpoints::Consumer
    include ::Ovh::Endpoints::Account
    include ::Ovh::Endpoints::Ips
    include ::Ovh::Endpoints::Vps    
        
    def to_uri(path)
      "#{self.endpoint}#{path}"
    end

    def get(path, params: {}, headers: {}, options: {})
      request path, method: :get, params: params, headers: headers, options: options
    end

    def post(path, params: {}, data: {}, headers: {}, options: {})
      request path, method: :post, params: params, data: data, headers: headers, options: options
    end
    
    def put(path, params: {}, data: {}, headers: {}, options: {})
      request path, method: :put, params: params, data: data, headers: headers, options: options
    end
    
    def delete(path, params: {}, data: {}, headers: {}, options: {})
      request path, method: :delete, params: params, data: data, headers: headers, options: options
    end
    
    def auth(uri)
      timestamp   =   Time.now.to_i
      
      signature   =   "$1$#{Digest::SHA1.hexdigest("#{self.configuration.application_secret}+#{self.configuration.consumer_key}+GET+#{uri}++#{timestamp}")}"

      headers     =   {
        'X-Ovh-Timestamp'   => timestamp.to_s,
        'X-Ovh-Signature'   => signature,
        'x-Ovh-Consumer'    => self.configuration.consumer_key
      }
    end

    def request(path, method: :get, params: {}, data: {}, headers: {}, options: {}, retries: 3)
      uri                           =   to_uri(path)
      
      headers["User-Agent"]         =   options.fetch(:user_agent, self.configuration.faraday.fetch(:user_agent, nil))
      headers["X-Ovh-Application"]  =   self.configuration.application_key
      headers                       =   headers.merge(auth(uri)) if options.fetch(:sign_request, true)
    
      connection    =   ::Faraday.new(url: uri) do |builder|
        builder.headers = headers
        
        builder.request  :json
        builder.response :json
        builder.response :logger if self.configuration.verbose_faraday?
  
        builder.adapter :net_http
      end
      
      response              =   nil
      
      begin
        response            =   case method
          when :get, :head, :options
            connection.send(method) do |request|
              request.params  =   params if params && !params.empty?
            end
          when :post, :put, :patch, :delete
            connection.send(method) do |request|
              request.body    =   data if data && !data.empty?
              request.params  =   params if params && !params.empty?
            end
        end
      rescue Faraday::TimeoutError, Faraday::ConnectionFailed, Faraday::ParsingError => e
        retries -= 1
        retry if retries > 0
      end
      
      return response&.body
    end
          
  end
end
