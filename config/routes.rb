Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root "products#index"

  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
  resources :purchase, only: :show do
    member do
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

  resources :users, only: :show do
    collection do
      get 'card'
    end
  end

  resources :products do
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end
end
