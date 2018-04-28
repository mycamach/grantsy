Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'subscriptions/index'

  resources :subscriptions, only: :index do
    resources :orders, only: [:create]
  end

  resources :orders, only: :index do
    collection do
      get 'clean'
    end
  end

  root 'funds#index'
  get 'calendar/index'
  resources :funds

  get 'organizations/index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :billings, only: [:index] do
    collection do
      get 'pre_payment'
      get 'execute'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
