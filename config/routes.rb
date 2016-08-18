require 'sidekiq/web'
Rails.application.routes.draw do
  resources :scan_items

  resources :spec_scans

  resources :baselines

  resources :projects do 
  	get :baseline
  	get :scan
  end

  mount Sidekiq::Web => '/sidekiq'
  root to: 'projects#index'
end
