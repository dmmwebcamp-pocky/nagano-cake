Rails.application.routes.draw do
  root 'home#top'

  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: "customers/sessions",
  }

  devise_for :admins

  resource :customers
  get 'customers/withdraw' => 'customers#withdraw'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
