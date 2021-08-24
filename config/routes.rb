Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:index, :show, :create, :update, :edit, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  get "about" => "homes#about" ,as: "about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
