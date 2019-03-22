# frozen_string_literal: true

# Compare throw items of user and computer.
class CompareService
  def self.compare(user_pick, comp_pick)
    new(user_pick, comp_pick).compare
  end

  def initialize(user_pick, comp_pick)
    @user_pick = user_pick
    @comp_pick = comp_pick
  end

  def compare
    @user_pick <=> @comp_pick
  end
end
