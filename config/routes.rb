Proofswap::Application.routes.draw do
  get 'swaps/index'

  root "pages#home"    
  get "home", to: "pages#home", as: "home"
  
  devise_for :users

  resources :swaps
  
  namespace :admin do
    root "base#index"
    resources :users
  end
  
end
