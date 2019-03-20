# frozen_string_literal: true

require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test 'should get init' do
    get games_init_url
    assert_response :success
  end
end
