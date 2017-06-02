Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  resources :questions do
    resources :answers, shallow: true
  end

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#delete'
  post 'login' => 'sessions#create'
  get 'home' => 'static_pages#home'
  root 'static_pages#home' 
end
