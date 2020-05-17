Rails.application.routes.draw do
  root 'home#top'

  devise_for :customers
  devise_for :admins

  resource :customers
  get 'customers/withdraw' => 'customers#withdraw'
  get 'products/show' => 'products/show'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #my root
  resources :products, only: [:show, :index]

  namespace :admin do
  	resources :products
  end
end
