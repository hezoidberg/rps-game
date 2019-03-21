# frozen_string_literal: true

require 'faraday'

# Endpoing for retrieving throw item from curb.
class CurbResponseService
  URL = Rails.configuration.curb['game_url']

  def self.throw_item
    new.throw_item
  end

  def throw_item
    resp = Faraday.new(url: URL).get
    JSON.parse resp.body
  end
end
