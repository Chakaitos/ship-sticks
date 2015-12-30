Rails.application.routes.draw do

  resources :products
  get '/products/:length/:width/:height/:weight' => 'products#find_best_match'

  root 'products#index'
end
