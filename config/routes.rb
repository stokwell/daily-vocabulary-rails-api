Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }



  # root to: redirect("/workspace/#{I18n.default_locale}")
  # get "/workspace/#{I18n.default_locale}", to: "workspace#index"

  root to: "workspace#index"

  scope :workspace do

    # scope "/:locale", locale: /#{I18n.available_locales.join("|")}/, defaults: { locale: "en" }  do

      resources :readings, only: [:index, :show, :create]
      resources :words do
        collection do
          get :search
        end
      end
    # end
  end

  namespace :api do
      get 'login/:provider', to: redirect('/users/%{provider}/')
      get '/auth/:provider/callback', to: 'auth#create'
  #   devise_for :users, controllers: { omniauth_callbacks: 'api/users/omniauth_callbacks' }
  #   post 'user_token' => 'user_token#create'
  #   resources :words, only: [:index, :create]
  #   resources :readings, only: [:index, :show, :create]
  #   get 'readings/:id/get_pdf', to: 'readings#get_pdf'
  #   post "/graphql", to: "graphql#execute"
  #   post "graphql" => "graphql#create"
  end
end
