Rails.application.routes.draw do
  namespace :admin do
    resources :customers
  end
  root 'home#top'

  devise_for :customers
  devise_for :admins, :controllers => {
  	:registrations => 'admins/registrations',
  	:sessions => 'admins/sessions'
  }

  devise_scope :admin do
  	get "sign_in", :to => "admins/sessions#new"
  	get "sign_out", :to => "admins/sessions#destroy"
  end

  resource :customers
  get 'customers/withdraw' => 'customers#withdraw'
  get 'admin/top' => 'admin#top'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
