RSpec.describe Ovh::Configuration do
  describe "default configuration" do
    let(:configuration) { Ovh::Configuration.new }
    
    expectations = {
      api_host:           "https://eu.api.ovh.com",
      api_version:        1.0,
      application_key:    nil,
      application_secret: nil,
      consumer_key:       nil
    }
  
    expectations.each do |key, value|
      it "should have correct value for instance variable #{key}" do
        expect(configuration.send(key)).to eq value
      end
    end

  end
end
