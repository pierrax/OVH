RSpec.configure do |config|
  config.before(:each) do
    Ovh.configure do |config|
      config.application_key        =   nil
      config.application_secret     =   nil
      config.consumer_key           =   nil
    end
  end
end

require "yaml"

def setup_configuration
  cfg_path              =   File.join(File.dirname(__FILE__), "../../config/credentials.yml")

  if ::File.exists?(cfg_path)
    cfg                 =   YAML.load_file(cfg_path)

    ::Ovh.configure do |config|
      config.application_key        =   cfg.fetch("application_key", nil)
      config.application_secret     =   cfg.fetch("application_secret", nil)
      config.consumer_key           =   cfg.fetch("consumer_key", nil)
    end
  end
end
