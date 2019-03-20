# frozen_string_literal: true

Rails.application.routes.draw do
  get 'games/init'
  get 'games/throw/:type', to: 'games#throw'

  root 'games#init'
end
