# frozen_string_literal: true

# Factory for creating throw item by type.
class ThrowItemFactory
  KNOWN_ITEMS = {
    'rock' => Game::Rock.new,
    'paper' => Game::Paper.new,
    'scissors' => Game::Scissors.new
  }.freeze

  def self.get_by_type(str)
    raise "Unknown item found - #{str}" unless KNOWN_ITEMS.key?(str)

    KNOWN_ITEMS[str]
  end
end
