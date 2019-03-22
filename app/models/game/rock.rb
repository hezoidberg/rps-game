# frozen_string_literal: true

module Game
  # Rock beats scissors. Paper beats rock.
  class Rock < ThrowItem
    def initialize
      super('rock')
    end

    def <=>(other)
      return 0 if other.type == 'rock'
      return 1 if other.type == 'scissors'
      return -1 if other.type == 'paper'

      raise "Not implemented item found #{other}"
    end
  end
end
