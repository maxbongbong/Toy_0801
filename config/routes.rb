Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root'home#index'
  resources :products
  resources :contacts
  resources :comments
  resources :orders do
    collection do
      get :cart
      delete :destroy
    end
    member do
      get :payment
      post :payment_completed
    end
  end
  resources :line_items do
    collection do # helper_method 사용 (application.controller)
      get :add_cart
      get :update_amount
    end
  end
end
