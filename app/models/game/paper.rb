# frozen_string_literal: true

module Game
  # Paper beats rock. Scissors beats paper.
  class Paper < ThrowItem
    def initialize
      super('paper')
    end

    def <=>(other)
      return 0 if other.type == 'paper'
      return 1 if other.type == 'rock'
      return -1 if other.type == 'scissors'

      raise "Not implemented item found #{other}"
    end
  end
end
