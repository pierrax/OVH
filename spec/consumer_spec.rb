RSpec.describe Ovh::Client do
  describe :request_consumer_key, vcr: {cassette_name: 'ovh/consumer/request_consumer_key'} do
    before { setup_configuration }
    let(:response) { Ovh::Client.new.request_consumer_key }
    
    it { expect(response).to be_a_kind_of(Hash) }
    
    it "should return a validation url" do
      expect(response.fetch("validationUrl", nil)&.to_s).not_to be_empty
    end
    
    it "should return a consumer key" do
      expect(response.fetch("consumerKey", nil)&.to_s).not_to be_empty
    end

  end
end
