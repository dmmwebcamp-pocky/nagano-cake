Rails.application.routes.draw do

  get 'search' => 'search#search'
  namespace :admin do
    resources :customers
  end

  root 'home#top'

  devise_for :customers

  delete 'customer/cart_items/:id' => 'customer/cart_items#cancel', as:'cart_items_cancel'

  namespace :admin do
    resources :customers
  end

  namespace :customer do
    resource :customers
    resources :products, only: [:show, :index, :new, :create] do
      resources :comments ,only: [:create, :destroy]
    end
    resources :cart_items, only: [:index, :new, :create, :update]
  end

  devise_for :admins

  get '/admin/top' => 'admin#top'

  get 'customer/customers/withdraw' => 'customer/customers#withdraw'

  get 'home/search/:genre_id' => 'home#search', as:'home_search'
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

  namespace :admin do
    resource :ordered_products, only: [:update]
  end

end
