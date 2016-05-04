Rails.application.routes.draw do
  get 'rooms/show'

  root to: "welcome#index"
  mount ActionCable.server => "/cable"
end
