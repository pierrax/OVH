module Ovh
  module Endpoints
    module Consumer
      
      def request_consumer_key(access_rules: {}, options: {})
        # Don't sign the request since we don't have the consumer key yet.
        options[:sign_request]  =   false
        
        if access_rules.nil? || access_rules.empty?
          # Grant default GET access if no access rules have been supplied
          
          access_rules          =   [
            {'method': 'GET', 'path': '/*'},
          ]
        end
        
        data                    =   {
          "accessRules" => access_rules
        }
        
        response                =   post("/auth/credential", data: data, options: options)
      end
      
    end
  end  
end
