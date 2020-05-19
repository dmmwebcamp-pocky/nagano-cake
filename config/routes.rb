Rails.application.routes.draw do
  namespace :admin do
    resources :customers
  end
  root 'home#top'

  devise_for :customers

  namespace :customer do
    resource :customers
    resources :products, only: [:show, :index, :new, :create]
  end

  devise_for :admins

  get '/admin/top' => 'admin#top'

  get 'customer/customers/withdraw' => 'customer/customers#withdraw'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
  	resources :products
  end


  get 'cart_items' => "cart_items#show"

  namespace :admin do
  	resources :genres
  end

  namespace :admin do
    resources :orders
  end

end
