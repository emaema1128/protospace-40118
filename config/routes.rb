Rails.application.routes.draw do
  get 'prototypes/index'
root to: "prototypes#index"
resources :prototypes
end
