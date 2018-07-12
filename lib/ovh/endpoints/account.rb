module Ovh
  module Endpoints
    module Account
      
      def account_details(options: {})        
        get("/me", options: options)
      end
      
    end
  end  
end
