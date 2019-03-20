# frozen_string_literal: true

require 'faraday'

# Endpoing for retrieving throw item from curb.
class CurbResponseService
  URL = 'https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw'
  READ_TIMEOUT = 10

  def self.throw_item
    new.throw_item
  end

  def throw_item
    resp = Faraday.new(url: URL).get
    JSON.parse resp.body
  end
end
