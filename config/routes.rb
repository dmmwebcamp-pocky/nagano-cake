Rails.application.routes.draw do

  get 'search' => 'search#search'
  namespace :admin do
    resources :customers
  end

#deviseでコントローラー名(customers)をつけて作っていたらコントローラーを変更する
#変更しないとdeviseコントローラーを使うことになる
  devise_for :customers, :controllers => {
 :registrations => 'customers/registrations',
 :sessions => 'customers/sessions',
 :passwords => 'customers/passwords'
}

  root 'home#top'

  namespace :admin do
    resources :customers
  end

  namespace :customer do
    resource :customers

    delete 'cart_items' => 'cart_items#destroy', as: 'cart_items'
    delete 'cart_items/:id' => 'cart_items#cancel', as:'cart_items_cancel'
    resources :cart_items, only: [:index, :new, :create, :update]

    resources :products, only: [:show, :index, :new, :create] do
      resources :comments ,only: [:create, :destroy]
    end

    #get 'orders/show' => 'orders#show'
    get 'orders/input' => 'orders#input'
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/done' => 'orders#done'
    resources :orders, only: [:index, :show, :create]
    resources :shippings, only: [:index, :create, :edit, :update, :destroy]
    resources :products, only: [:show, :index, :new, :create]
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
    resources :ordered_products, only: [:update]
  end

  get 'home/about' => 'home#about'

end
