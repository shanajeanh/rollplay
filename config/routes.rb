Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :auth, only: :show
  resources :sessions, only: [:create, :destroy]

  root to: 'characters#index'

  resources :characters do
    resources :ranks, only: [:index]
    resources :feats, except: [:show, :index, :delete]
  end

  resources :feats, only: [:delete]

end
