Rails.application.routes.draw do
  root 'home#top'

  devise_for :customers
  

  namespace :customer do
  	resource :customers
  end

  devise_for :admins

  get 'customer/customers/withdraw' => 'customer/customers#withdraw'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
  	resources :products
  end


  get 'cart_items' => "cart_items#show"

  namespace :admin do
  	resources :genres
  end


end
