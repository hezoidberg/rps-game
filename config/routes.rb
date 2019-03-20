Rails.application.routes.draw do
  get 'games/init'

  root 'games#init'
end
