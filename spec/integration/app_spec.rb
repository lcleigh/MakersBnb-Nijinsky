require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "Get /" do
    it "returns a 200 status code" do
      response = get("/")
      expect(response.status).to eq(200)
      expect(response.body).to include "<h1> Feel at home anywhere </h1>"
    end

    it "shows a list of spaces" do
      response = get("/")

      expect(response.status).to eq(200)
      expect(response.body).to include "<a href='/spaces'>View all spaces</a>"
    end
  end

  context "/spaces" do
    it "returns a 200 status code" do
      response = get("/spaces")
      
      expect(response.status).to eq(200)
      expect(response.body).to include "Treehouse"
    end
  end
end
