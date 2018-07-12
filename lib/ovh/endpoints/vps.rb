module Ovh
  module Endpoints
    module Vps
      
      def vps(options: {})        
        get("/vps", options: options)
      end
      
      def vps_service(service_name, options: {})        
        get("/vps/#{service_name}", options: options)
      end
      
      # Ips associated to this virtual server
      def vps_ips(service_name, options: {})        
        get("/vps/#{service_name}/ips", options: options)
      end
      
      # Get the countries you can select for your IPs geolocation
      def vps_ip_countries_available(service_name, options: {})        
        get("/vps/#{service_name}/ipCountryAvailable", options: options)
      end
      
    end
  end  
end
