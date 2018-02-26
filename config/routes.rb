Rails.application.routes.draw do
  namespace :api do
    post 'user_token' => 'user_token#create'
    resources :words, only: [:index, :create]
    resources :readings, only: [:index, :show, :create]

    get 'readings/:id/get_pdf', to: 'readings#get_pdf'

  end
end
