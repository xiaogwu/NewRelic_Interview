require 'rspec'
require 'rack/test'
require 'sinatra'
require 'pry'
require 'json'

describe 'API' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  before do
  end

  it "sends out e-mail" do
    body = { "to" => "Hey <wahl77@gmail.com>" }
    post '/send', body.to_json, {'Content-type' => 'application/json'}
    expect(last_response).to be_ok
  end
end
