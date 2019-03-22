# frozen_string_literal: true

module Game
  # Scissors beats paper. Rock beats scissors.
  class Scissors < ThrowItem
    def initialize
      super('scissors')
    end

    def <=>(other)
      return 0 if other.type == 'scissors'
      return 1 if other.type == 'paper'
      return -1 if other.type == 'rock'

      raise "Not implemented item found #{other}"
    end
  end
end
