Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :auth, only: :show
  resources :sessions, only: [:create, :destroy]

  root to: 'characters#index'

  resources :users, only: [:destroy]

  resources :characters do
    resources :ranks, only: [:index]
    resources :feats, except: [:show, :index]
    resources :spells, except: [:show, :index]
    resources :class_abilities, except: [:show, :index]
    resources :weapons, except: [:show, :index]
  end
end
