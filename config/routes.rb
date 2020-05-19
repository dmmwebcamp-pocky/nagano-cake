Rails.application.routes.draw do
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    get 'orders/update'
  end
  root 'home#top'

  devise_for :customers
  

  namespace :customer do
    resource :customers
    #仮ルート
    get 'orders/show' => 'orders#show'
    #    
    get 'orders/input' => 'orders#input'
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/done' => 'orders#done'
    resources :orders, only: [:index, :show, :create]
    #仮ルート
    get 'shippings/edit' => 'shippings#edit'
    #
    resources :shippings, only: [:index, :create, :edit, :update, :destroy]
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

  namespace :admin do
    resources :orders
  end

end
