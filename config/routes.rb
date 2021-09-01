Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:index, :show, :create, :update, :edit, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  get "home/about" => "homes#about" ,as: "about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
