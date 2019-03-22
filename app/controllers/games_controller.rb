# frozen_string_literal: true

# Controller that described all Rock-Paper-Scissors endpoints.
class GamesController < ApplicationController
  def init; end

  def throw
    user_pick = ThrowItemFactory.get_by_type(params[:type])
    comp_pick = ThrowItemService.throw
    render json: {
      user_pick: user_pick,
      comp_pick: comp_pick,
      winner: CompareService.compare(user_pick, comp_pick)
    }
  end
end
