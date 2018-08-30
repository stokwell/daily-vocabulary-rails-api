Rails.application.routes.draw do
  devise_for :users
  root to: "words#index"
  get '', to: redirect("/#{I18n.default_locale}")


  scope ":locale", locale: /#{I18n.available_locales.join("|")}/, defaults: {locale: "en"}  do
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
