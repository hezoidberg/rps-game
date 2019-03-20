# frozen_string_literal: true

require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  def setup
    stub_request(:get, 'https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v0.15.4'
        }
      )
      .to_return(status: 200, body: { "statusCode": 200, "body": '"rock"' }.to_json, headers: {})
  end

  test 'should get init' do
    puts games_init_url
    get games_init_url
    assert_response :success
  end

  test 'test success responses' do
    get '/games/throw/scissors', params: { type: 'scissors' }
    assert_response :success
    body = JSON.parse(response.body)
    assert_equal(-1, body['winner'])
  end
end
