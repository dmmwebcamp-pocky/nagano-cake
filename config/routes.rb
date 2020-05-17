Rails.application.routes.draw do
  root 'home#top'

  devise_for :customers
  devise_for :admins

  resource :customers
  get 'customers/withdraw' => 'customers#withdraw'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
  	resources :products
  end

  namespace :admin do
  	resources :genres
  end

end
