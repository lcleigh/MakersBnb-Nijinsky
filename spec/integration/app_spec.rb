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
      expect(response.body).to include "<a href='/all_spaces'>View all spaces</a>"
    end
  end

  context "/all_spaces" do
    it "returns a list of spaces" do
      response = get("/all_spaces")
      
      expect(response.status).to eq(200)
      expect(response.body).to include "Treehouse"
    end
  end

  context 'GET /all_spaces/:id' do
    it 'returns info about space at index 1' do
      response = get('/all_spaces/1')
      expect(response.status).to eq(200)
      expect(response.body).to include ('<h1>Treehouse</h1>')
      expect(response.body).to include ('Price: £200')
      expect(response.body).to include ('Sleep in the trees.')
    end

    it 'returns info about a space at index 2' do
      response = get('/all_spaces/2')
      expect(response.status).to eq(200)
      expect(response.body).to include ('<h1>Lighthouse</h1>')
      expect(response.body).to include ('Price: £350')
      expect(response.body).to include ('Views of the sea.')
    end
  end

  context 'GET /sign_up' do
    it 'invites user to sign up for account' do
      response = get('/sign_up')
      expect(response.status).to eq(200)
      expect(response.body).to include ('Create your account')
    end
  end

  context 'POST /sign_up' do
    it 'creates a new user' do
      response = post('/sign_up', name: 'Stan', email: 'stan@dog.com', password: 'password', phone_number: '123456789')
      expect(response.status).to eq(200)

      
end
