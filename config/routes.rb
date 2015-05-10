Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
      resources :groups, except: [:new, :edit]
      resources :locations, except: [:new, :edit]
      resources :training_sessions, except: [:new, :edit]

      resources :invitations, only: [:index, :show, :update]
      resources :allowances, only: [:index, :show]
    end
  end

  namespace :users do
    get '/:token/invitations', to: 'invitations#index', as: :user_invitations
  end

  namespace :admin do
    resources :users, except: :show
    resources :locations, except: [:show, :destroy]
    resources :groups, except: [:show, :destroy]
    resources :training_sessions
  end

  resources :training_sessions, only: [:show]
  resources :invitations, only: [:update]
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'training_sessions#index'

end
