Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
      resources :groups, except: [:new, :edit]
      resources :locations, except: [:new, :edit]
      resources :training_sessions, except: [:new, :edit]
    end
  end

end
