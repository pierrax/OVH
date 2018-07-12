module Ovh
  module Endpoints
    module Ips
      
      def ips(options: {})        
        get("/ip", options: options)
      end
      
      def ip_load_balancing(options: {})        
        get("/ip/loadBalancing", options: options)
      end
      
      def ip_services(options: {})        
        get("/ip/service", options: options)
      end
      
      def ip_service(service_name, options: {})        
        get("/ip/service/#{service_name}", options: options)
      end
      
    end
  end  
end
