require_relative 'spec_helper'
require 'rspec'
require 'pry'

describe 'API' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "sends out e-mail", type: :request do
    body = { "to" => "Hey <wahl77@gmail.com>" }
    post '/send', body.to_json, {'Content-type' => 'application/json'}
    expect(last_response).to be_ok
  end

  it "fails if email is invalid, sends to default", type: :request do
    body = { "to" => "Hey <wahl77.mail.com>" }
    post '/send', body.to_json, {'Content-type' => 'application/json'}
    expect(last_response.body.match(DEFAULT_TO).length).to eql(1)
  end

end
