Rails.application.routes.draw do
  get 'homes/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    authenticated :user do
      root 'profiles#show', as: :authenticated_root
    end

    unauthenticated do
      root 'homes#index', as: :unauthenticated_root
    end
  end

  resources :profiles, only: [:show, :update]
  resources :homes, only: [:index]
  get '/:username', to: 'homes#map', as: 'map'
end
