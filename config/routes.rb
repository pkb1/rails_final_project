Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  get 'items/index'
  get 'items_imports/new'
  get 'items_imports/create'
  resources :items
  resources :items_imports
  root to: "students#index"
  resources :students
  devise_for :users, skip: :omniauth_callbacks
  get '/search' => 'search#search_student'
  get '/search1' => 'search#search_book'
  resources :messages
  get 'pages/home'
  get 'download_sample_excel' => 'items_imports#download_sample_excel'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end
end
