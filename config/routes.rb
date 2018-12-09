Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'auth/callbacks' }

  scope "/:locale", locale: /#{I18n.available_locales.join("|")}/, defaults: { locale: "en" }  do
    root to: "words#index"
    resources :readings, only: [:index, :show, :create]
    resources :words, only: [:index, :show, :create, :new]
  end

  namespace :api do
    post 'user_token' => 'user_token#create'
    resources :words, only: [:index, :create]
    resources :readings, only: [:index, :show, :create]
    get 'readings/:id/get_pdf', to: 'readings#get_pdf'

    post "/graphql", to: "graphql#execute"
    post "graphql" => "graphql#create"
  end
end
