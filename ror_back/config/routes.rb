Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'static#pages'

  %w[admin all_compliments login register profile].each do |r|
    get "/#{r}", to: 'static#pages'
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :compliments, only: %i[show index]

        collection do
          get :all
          get :me
          get '/:name', to: 'users#profile'

          post :register
          post :login
          post :logout

          patch :update
        end

        member do
          delete :delete
        end
      end

      resources :compliments, only: %i[destroy] do
        collection do
          get :random, to: 'compliments#random'
          get '/sorted', to: 'compliments#sorted'

          post '/create', to: 'compliments#create'

          delete '/all', to: 'compliments#destroy_all'
        end

        member do
          patch :like
          patch :unlike
          patch :dislike
          patch :undislike
        end
      end
    end
  end
end
