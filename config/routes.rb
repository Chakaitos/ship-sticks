Rails.application.routes.draw do

  resources :products, except: :show
  get '/products/dimensions/:length/:width/:height/:weight' => 'products#find_best_match'

  root 'products#index'
end
