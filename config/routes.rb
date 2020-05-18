Rails.application.routes.draw do
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    get 'orders/update'
  end
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

  namespace :admin do
    resources :orders
  end

end
