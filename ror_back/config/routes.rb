Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'articles#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        collection do
          get :me
          get :all

          post :register
          post :login
          post :logout

          patch :update

          delete :delete
        end
      end

      resources :compliments, only: %i[delete show] do
        collection do
          root to: 'compliments#get_sorted'
          get :random, to: 'compliments#get_random'
          post '/create', to: 'compliments#create'
          delete '/', to: 'compliments#delete_all'
        end

        member do
          patch :like
          patch :unlike
          patch :dislike
        end
      end
    end
  end
end
