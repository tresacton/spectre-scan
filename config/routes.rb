require 'sidekiq/web'
Rails.application.routes.draw do

  resources :projects do 
  	get :baseline
  	get :scan
  end

  mount Sidekiq::Web => '/sidekiq'
  root to: 'projects#index'
end
