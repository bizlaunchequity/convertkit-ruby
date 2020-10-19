require "spec_helper"

module Convertkit
  class Client
    describe Subscribers do
      before do
        Convertkit.configure do |config|
          config.api_secret = "7ODslJwW6CbZyQiurW90Samr5-hnLRk4C8m0ngh6xng"
          config.api_key = "NKN6OZ--XGOzjEeTRC-ybg"
        end

        @client = Convertkit::Client.new
      end

      describe "#subscribers" do
        it "sends the right request" do
          expect(@client.subscribers.success?).to be_truthy
          expect(@client.subscribers.body).to_not eql({"error"=>"Authorization Failed", "message"=>"API Key not present"})
        end
      end

      describe "#subscriber" do
        it "sends the right request" do
          subscriber_id = "17681944"
          expect(@client.subscriber(subscriber_id).success?).to be_truthy
          expect(@client.subscriber(subscriber_id).body).to_not eql({"error"=>"Not Found", "message"=>"The entity you were trying to find doesn't exist"})
        end
      end
    end
  end
end
