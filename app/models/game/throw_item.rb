# frozen_string_literal: true

module Game
  # Basic class for game item.
  class ThrowItem
    include Comparable
    attr_reader :type

    def initialize(type)
      @type = type
    end

    def to_s
      type
    end
  end
end
