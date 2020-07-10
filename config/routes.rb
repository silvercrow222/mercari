Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root "products#index"

  resources :products
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
      end
end
